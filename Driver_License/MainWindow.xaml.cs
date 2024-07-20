using Driver_License.Models;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Driver_License
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private readonly SupportLicenseContext context = new SupportLicenseContext();

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string userName = UsernameTextBox.Text;
                string password = PasswordTextBox.Password;

                // Kiểm tra nếu thiếu thông tin
                if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ tài khoản và mật khẩu.");
                    return;
                }

                    var account = context.Accounts.FirstOrDefault(acc => acc.UserName == userName && acc.Password == password && acc.IsDelete == false);
                    
                    if (account == null)
                    {
                        MessageBox.Show("Tài khoản hoặc mật khẩu không chính xác.");
                        return;
                    }

                    SelectLicenseTypeWindow selectLicenseTypeWindow = new SelectLicenseTypeWindow(account);
                    selectLicenseTypeWindow.Show();
                    this.Close();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Đã xảy ra lỗi: {ex.Message}");
            }
        }

        private void SignUpLink_MouseDown(object sender, RoutedEventArgs e)
        {
            SignupWindow signupWindow = new SignupWindow();
            signupWindow.Show();
            this.Close();
        }
    }
}