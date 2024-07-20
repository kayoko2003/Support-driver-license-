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
    /// Interaction logic for AddPenalizeWindow.xaml
    /// </summary>
    public partial class AddPenalizeWindow : Window
    {
        private SupportLicenseContext context = new SupportLicenseContext();
        private Account account;
        public AddPenalizeWindow(Account account)
        {
            InitializeComponent();
            this.account = account;
            LoadLicenseTypes();
        }

        private void LoadLicenseTypes()
        {
            var licenseTypes = context.LicenseTypes.ToList();
            cbLicenseType.ItemsSource = licenseTypes;
            cbLicenseType.DisplayMemberPath = "Name";
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

            if (cbLicenseType.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn loại giấy phép.");
                return;
            }

            var penalize = new Penalize
            {
                Content = tbContent.Text,
                Fines = tbFines.Text,
                LicenseTypeId = (cbLicenseType.SelectedItem as LicenseType)?.LicenseTypeId,
                CreateBy = account.AccountId,
                IsDelete = false
            };

            context.Penalizes.Add(penalize);
            context.SaveChanges();

            MessageBox.Show("Mức phạt mới đã được thêm thành công!");

            ListPenalizeWindow listPenalizeWindow = new ListPenalizeWindow(account);
            listPenalizeWindow.Show();

            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            ListPenalizeWindow listPenalizeWindow = new ListPenalizeWindow(account);
            listPenalizeWindow.Show();
            this.Close();
        }
    }
}
