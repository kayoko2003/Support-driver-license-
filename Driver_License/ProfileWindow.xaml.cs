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
    /// Interaction logic for ProfileWindow.xaml
    /// </summary>
    public partial class ProfileWindow : Window
    {
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        private Account account;

        private bool isEditable = false;
        public ProfileWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
            myProfile.DataContext = account;
            DobDatePicker.SelectedDate = account.Dob.Value.ToDateTime(new TimeOnly(0, 0));
            if(account.Gender == true)
            {
                MaleRadioButton.IsChecked = true;
            }
            else
            {
                FemaleRadioButton.IsChecked = true;
            }
            if (account.IsAdmin == true)
            {
                manage.Visibility = Visibility.Visible;
            }
        }

        private void ChangePassword_Click(object sender, RoutedEventArgs e)
        {
            var changePasswordWindow = new ChangePasswordWindow(account);
            changePasswordWindow.ShowDialog();
        }

        private void EditProfile_Click(object sender, RoutedEventArgs e)
        {
            isEditable = !isEditable;
            EmailTextBox.IsReadOnly = !isEditable;
            MaleRadioButton.IsEnabled = isEditable;
            FemaleRadioButton.IsEnabled = isEditable;
            DobDatePicker.IsEnabled = isEditable;

            if (isEditable)
            {
                EditButton.Content = "Lưu";
            }
            else
            {
                
                account.Email = EmailTextBox.Text;
                account.Gender = MaleRadioButton.IsChecked == true;
                account.Dob = DateOnly.FromDateTime(DobDatePicker.SelectedDate.Value);

                if (string.IsNullOrWhiteSpace(EmailTextBox.Text) ||
                    DobDatePicker.SelectedDate == null ||
                    (MaleRadioButton.IsChecked == false && FemaleRadioButton.IsChecked == false))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin trước khi lưu.");
                    return;
                }

                // Lưu thông tin đã chỉnh sửa vào cơ sở dữ liệu
                try
                {
                    context.Accounts.Update(account);
                    context.SaveChanges();
                    MessageBox.Show("Cập nhật thông tin thành công!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Có lỗi xảy ra: " + ex.Message, "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
                }

                EditButton.Content = "Chỉnh sửa";
            }
        }
        private void ListViewMenu_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListViewMenu.SelectedItem != null)
            {
                var selectedItem = ListViewMenu.SelectedItem as ListViewItem;

                if (selectedItem == ItemPractice)
                {
                    SelectLicenseTypeWindow selectLicenseTypeWindow = new SelectLicenseTypeWindow(account);
                    selectLicenseTypeWindow.Show();
                    this.Close();
                }
                else if (selectedItem == manage)
                {
                    ListSettingWindow listSettingWindow = new ListSettingWindow(account);
                    listSettingWindow.Show();
                    this.Close();
                }

                // Deselect the item after handling
                ListViewMenu.SelectedItem = null;
            }
        }

        private void ButtonOpenMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Visible;
            ButtonOpenMenu.Visibility = Visibility.Collapsed;
        }

        private void ButtonCloseMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Collapsed;
            ButtonOpenMenu.Visibility = Visibility.Visible;
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            this.Close();
            mainWindow.Show();
        }
    }
}
