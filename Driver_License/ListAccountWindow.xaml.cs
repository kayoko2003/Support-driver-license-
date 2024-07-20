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
    /// Interaction logic for ListAccountWindow.xaml
    /// </summary>
    public partial class ListAccountWindow : Window
    {
        private Account account;
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        public ListAccountWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
            LoadAccount();
        }
        private void LoadAccount()
        {
            var accounts = context.Accounts.Where(a => a.IsAdmin == false && a.IsDelete == false).ToList();
            AccountGrid.ItemsSource = accounts;
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa tài khoản này?", "Xác nhận xóa", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            var button = sender as Button;
            var getAccount = button.DataContext as Account;

            if (result == MessageBoxResult.Yes)
            {
                var deleteAccount = context.Accounts.FirstOrDefault(a => a.AccountId == getAccount.AccountId);
                if (deleteAccount != null)
                {
                    deleteAccount.IsDelete = true;

                    context.SaveChanges();

                    MessageBox.Show("Tài khoản này đã được xóa thành công!");
                }
                else
                {
                    MessageBox.Show("Không tìm thấy tài khoản để xóa.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                }

                ListAccountWindow listAccountWindow = new ListAccountWindow(account);
                listAccountWindow.Show();
                this.Close();
            }
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string filter = search.Text.ToLower();
            var accounts = context.Accounts.Where(q => q.UserName.ToLower().Contains(filter) && q.IsDelete == false && q.IsAdmin == false).ToList();
            AccountGrid.ItemsSource = accounts;
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            ListSettingWindow listSettingWindow = new ListSettingWindow(account);
            listSettingWindow.Show();
            this.Close();
        }
    }
}
