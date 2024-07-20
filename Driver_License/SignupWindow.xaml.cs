using Driver_License.Models;
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
    /// Interaction logic for SignupWindow.xaml
    /// </summary>
    public partial class SignupWindow : Window
    {
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        public SignupWindow()
        {
            InitializeComponent();
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Thu thập thông tin từ giao diện
                string userName = UsernameTextBox.Text;
                string email = EmailTextBox.Text;
                bool? gender = null;
                if (GenderRadioMale.IsChecked == true) gender = true;
                if (GenderRadioFemale.IsChecked == true) gender = false;
                DateTime? dob = DobTextBox.SelectedDate;
                string password = PasswordTextBox.Password;
                string confirmPassword = ConfirmPasswordTextBox.Password;

                // Kiểm tra nếu thiếu thông tin
                if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(email) || gender == null || dob == null || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.");
                    return;
                }

                // Kiểm tra mật khẩu và xác nhận mật khẩu
                if (password != confirmPassword)
                {
                    MessageBox.Show("Mật khẩu và xác nhận mật khẩu không khớp.");
                    return;
                }

                    var existingAccount = context.Accounts.FirstOrDefault(acc => acc.UserName == userName);
                    if (existingAccount != null)
                    {
                        MessageBox.Show("Tài khoản đã tồn tại. Vui lòng chọn tên tài khoản khác.");
                        return;
                    }

                    // Tạo đối tượng Account mới
                    Account newAccount = new Account
                    {
                        UserName = userName,
                        Password = password,
                        Email = email,
                        Gender = gender,
                        Dob = DateOnly.FromDateTime(dob.Value),
                        IsAdmin = false,
                        IsDelete = false,
                    };

                    context.Accounts.Add(newAccount);
                    context.SaveChanges();

                MessageBox.Show("Đăng ký thành công!");

                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Đã xảy ra lỗi: {ex.Message}");
            }
        }

        private void LoginLink_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
