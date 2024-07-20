using Driver_License.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Driver_License
{
    /// <summary>
    /// Interaction logic for ChangePasswordWindow.xaml
    /// </summary>
    public partial class ChangePasswordWindow : Window
    {
        private Account account;
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        public ChangePasswordWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
        }

        private void ChangePassword_Click(object sender, RoutedEventArgs e)
        {
            string currentPassword = CurrentPasswordBox.Password;
            string newPassword = NewPasswordBox.Password;
            string confirmPassword = ConfirmPasswordBox.Password;

            if (currentPassword != account.Password)
            {
                MessageBox.Show("Mật khẩu hiện tại không đúng.");
                return;
            }

            if (newPassword != confirmPassword)
            {
                MessageBox.Show("Mật khẩu mới và xác nhận mật khẩu không khớp.");
                return;
            }

            if (string.IsNullOrWhiteSpace(newPassword))
            {
                MessageBox.Show("Mật khẩu mới không được để trống.");
                return;
            }

            account.Password = newPassword;
            try
            {
                context.Accounts.Update(account);
                context.SaveChanges();
                MessageBox.Show("Đổi mật khẩu thành công!");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Có lỗi xảy ra: " + ex.Message, "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
