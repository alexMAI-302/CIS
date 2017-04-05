namespace CIS
{
    partial class Form1
    {
        /// <summary>
        /// Требуется переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Обязательный метод для поддержки конструктора - не изменяйте
        /// содержимое данного метода при помощи редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.cb_goods = new System.Windows.Forms.ComboBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.btn_order = new System.Windows.Forms.Button();
            this.btn_exit = new System.Windows.Forms.Button();
            this.tb_total_count = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // cb_goods
            // 
            this.cb_goods.FormattingEnabled = true;
            this.cb_goods.Location = new System.Drawing.Point(13, 59);
            this.cb_goods.Name = "cb_goods";
            this.cb_goods.Size = new System.Drawing.Size(206, 21);
            this.cb_goods.TabIndex = 0;
            this.cb_goods.SelectedIndexChanged += new System.EventHandler(this.cb_goods_SelectedIndexChanged);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(225, 60);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 1;
            // 
            // btn_order
            // 
            this.btn_order.Location = new System.Drawing.Point(331, 57);
            this.btn_order.Name = "btn_order";
            this.btn_order.Size = new System.Drawing.Size(121, 23);
            this.btn_order.TabIndex = 2;
            this.btn_order.Text = "Заказать";
            this.btn_order.UseVisualStyleBackColor = true;
            this.btn_order.Click += new System.EventHandler(this.btn_order_Click);
            // 
            // btn_exit
            // 
            this.btn_exit.Location = new System.Drawing.Point(331, 227);
            this.btn_exit.Name = "btn_exit";
            this.btn_exit.Size = new System.Drawing.Size(121, 23);
            this.btn_exit.TabIndex = 3;
            this.btn_exit.Text = "Выход";
            this.btn_exit.UseVisualStyleBackColor = true;
            this.btn_exit.Click += new System.EventHandler(this.btn_exit_Click);
            // 
            // tb_total_count
            // 
            this.tb_total_count.Location = new System.Drawing.Point(225, 25);
            this.tb_total_count.Name = "tb_total_count";
            this.tb_total_count.Size = new System.Drawing.Size(100, 20);
            this.tb_total_count.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Товар";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(222, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "В наличии (шт.)";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(464, 262);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tb_total_count);
            this.Controls.Add(this.btn_exit);
            this.Controls.Add(this.btn_order);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.cb_goods);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "Поставка FIFO";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cb_goods;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button btn_order;
        private System.Windows.Forms.Button btn_exit;
        private System.Windows.Forms.TextBox tb_total_count;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}

