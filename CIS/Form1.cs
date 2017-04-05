using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CIS
{
    public partial class Form1 : Form
    {
        private static string connectionstring = @"Data Source=ALEX-VAIO-ПК\SQLEXPRESS;Initial Catalog=kis;Integrated Security=True";
        public Form1()
        {
            InitializeComponent();

            cb_goods.Text = "Выберите товар";
            foreach (var item in LoadGoods())
                cb_goods.Items.Add(item);
            
        }

        public List<string> LoadGoods()
        {
            List<string> goods = new List<string>();
            using (SqlConnection connection = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand("dbo.kis_goods_read", connection);
                command.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    goods.Add(string.Format("{0} | {1}",reader["name"].ToString(), reader["id"].ToString()));
                }
                    
                reader.Close();
            }
            return goods;
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            Application.ExitThread();
        }

        private void cb_goods_SelectedIndexChanged(object sender, EventArgs e)
        {
            int count = 0;
            using (SqlConnection connection = new SqlConnection(connectionstring))
            {
                SqlCommand command = new SqlCommand("dbo.kis_good_count_get", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("Good_id", int.Parse(cb_goods.Text.Split('|')[1].Trim(' ')));
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                count = Convert.ToInt32(reader[0]);
                reader.Close();
            }
            if (count == 0)
            {
                tb_total_count.Text = "Товар отсутствует";
                return;
            }
            tb_total_count.Text = count.ToString();
        }

        private void btn_order_Click(object sender, EventArgs e)
        {
            int rec_count = int.Parse(textBox1.Text);
            if (rec_count > int.Parse(tb_total_count.Text))
            {
                MessageBox.Show("Такого количества товара нет.");
                return;
            }
            else
            {
                int delivery = 0;
                while (delivery != rec_count)
                {
                    int max = 0;
                    using (SqlConnection connection = new SqlConnection(connectionstring))
                    {
                        SqlCommand command = new SqlCommand("dbo.kis_read_maxcount", connection);
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("Good_id", int.Parse(cb_goods.Text.Split('|')[1].Trim(' ')));
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        reader.Read();
                        max = Convert.ToInt32(reader["volume"]);
                        reader.Close();
                        connection.Close();

                        if (rec_count <= max)
                        {
                            //товара из одной поставки хватает. Уменьшить кол-во на складе, добавить записи в delivery и recept-ы
                            delivery += rec_count;

                            Delivery(connection, command, rec_count);
                            
                            break;
                        }
                        else
                        {
                            //забрать все из самой поздней поставки, в следующую залезет цикл
                            if (delivery + max <=rec_count)
                            {
                                delivery += max;
                                Delivery(connection, command, max);
                            }
                            else
                            {
                                int need = rec_count - delivery;
                                delivery += need;

                                Delivery(connection, command, need);
                            }
                            
                        }
                    }
                    
                }
                tb_total_count.Text = (int.Parse(tb_total_count.Text) - rec_count).ToString();
                MessageBox.Show("Успех");
            }
        }

        private void Delivery(SqlConnection connection, SqlCommand command, int rec_count)
        {
            command = new SqlCommand("dbo.kis_delivery_record", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("Good_id", int.Parse(cb_goods.Text.Split('|')[1].Trim(' ')));
            command.Parameters.AddWithValue("vol", rec_count);
            command.Parameters.AddWithValue("idrec", 1); //всегда в одну поставку/отгрузку
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}
