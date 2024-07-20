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
    /// Interaction logic for PenalizeDetailsWindow.xaml
    /// </summary>
    public partial class PenalizeDetailsWindow : Window
    {
        private SupportLicenseContext context = new SupportLicenseContext();
        private Penalize penalize;
        private Account account;
        public PenalizeDetailsWindow(Penalize penalize, Account account)
        {
            InitializeComponent();
            this.penalize = penalize;
            this.account = account;
            LoadLicenseTypes();
            LoadPenalizeDetails();
        }

        private void LoadPenalizeDetails()
        {
            var licenseType = context.LicenseTypes.FirstOrDefault(x => x.LicenseTypeId == penalize.LicenseTypeId);
            tbContent.Text = penalize.Content;
            tbFines.Text = penalize.Fines;
            cbLicenseType.SelectedItem = licenseType;
        }

        private void LoadLicenseTypes()
        {
            var licenseTypes = context.LicenseTypes.ToList();
            cbLicenseType.ItemsSource = licenseTypes;
            cbLicenseType.DisplayMemberPath = "Name";
        }

        private bool isEditing = true;
        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            tbContent.IsEnabled = isEditing;
            tbFines.IsEnabled = isEditing;
            cbLicenseType.IsEnabled = isEditing;
            if(isEditing)
            {
                EditButton.Visibility = Visibility.Collapsed;
                CancelButton.Visibility = Visibility.Visible;
                deleteButton.Visibility = Visibility.Visible;
                SaveButton.Visibility = Visibility.Visible;
            }
            else
            {
                EditButton.Visibility = Visibility.Visible;
                CancelButton.Visibility = Visibility.Collapsed;
                deleteButton.Visibility = Visibility.Collapsed;
                SaveButton.Visibility = Visibility.Collapsed;
            }
            isEditing = !isEditing;
        }


        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbContent.Text))
            {
                MessageBox.Show("Vui lòng nhập nội dung mức phạt.");
                return;
            }

            if (string.IsNullOrWhiteSpace(tbFines.Text))
            {
                MessageBox.Show("Vui lòng nhập số tiền phạt.");
                return;
            }

            penalize = context.Penalizes.FirstOrDefault(e => e.PenalizeId == penalize.PenalizeId);

            penalize.Content = tbContent.Text;
            penalize.Fines = tbFines.Text;
            penalize.LicenseTypeId = (cbLicenseType.SelectedItem as LicenseType)?.LicenseTypeId;
            context.SaveChanges();

            MessageBox.Show("Thông tin mức phạt đã được cập nhật thành công!");

            ListPenalizeWindow listPenalizeWindow = new ListPenalizeWindow(account);
            listPenalizeWindow.Show();
            this.Close();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            ListPenalizeWindow listPenalizeWindow = new ListPenalizeWindow(account);
            listPenalizeWindow.Show();
            this.Close();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa mức phạt này?", "Xác nhận xóa", MessageBoxButton.YesNo, MessageBoxImage.Warning);

            if (result == MessageBoxResult.Yes)
            {
                var updatePenalize = context.Penalizes.FirstOrDefault(ex => ex.PenalizeId == penalize.PenalizeId);
                if (updatePenalize != null)
                {
                    updatePenalize.IsDelete = true;

                    context.SaveChanges();

                    MessageBox.Show("Mức phạt đã được xóa thành công!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("Không tìm thấy mức phạt để xóa.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                }

                ListPenalizeWindow listPenalizeWindow = new ListPenalizeWindow(account);
                listPenalizeWindow.Show();
                this.Close();
            }
        }
    }
}
