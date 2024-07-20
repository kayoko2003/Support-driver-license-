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
    /// Interaction logic for SelectExamWindow.xaml
    /// </summary>
    public partial class SelectExamWindow : Window
    {
        LicenseType licenseType;

        private Account account;

        private readonly SupportLicenseContext context = new SupportLicenseContext();
        public SelectExamWindow(LicenseType licenseType, Account account)
        {
            InitializeComponent();
            this.licenseType = licenseType;
            this.account = account;
            LoadExams();
        }

        private void LoadExams()
        {
            List<Exam> exams = context.Exams.Where(e => e.LicenseTypeId == licenseType.LicenseTypeId && e.IsDelete == false).ToList();
            int numExams = exams.Count;
            int numColumns = 2;
            int numRows = (numExams + numColumns - 1) / numColumns;

            // Set the row and column definitions dynamically
            for (int i = 0; i < numRows; i++)
            {
                RowDefinition rowDefinition = new RowDefinition();
                rowDefinition.Height = new GridLength(100);
                ButtonGrid.RowDefinitions.Add(rowDefinition);
            }
            for (int j = 0; j < numColumns; j++)
            {
                ColumnDefinition columnDefinition = new ColumnDefinition();
                columnDefinition.Width = new GridLength(1, GridUnitType.Star);
                ButtonGrid.ColumnDefinitions.Add(columnDefinition);
            }

            // Add buttons dynamically
            for (int i = 0; i < numExams; i++)
            {
                var exam = exams[i];

                var result = context.Results.FirstOrDefault(a => a.ExamId == exam.ExamId && a.AccountId == account.AccountId);

                Thickness margin;
                if (i % 2 == 0)
                {
                    margin = new Thickness(60, 10, 30, 10);
                }
                else
                {
                    margin = new Thickness(30, 10, 60, 10);
                }

                String examName = exam.Name;
                String color = "#1b7a90";
                if (result != null)
                {
                    examName += $" ({result.Result1} điểm)";
                    if (result.Result1 < 20)
                    {
                        color = "#FF0000";
                    }
                    else {
                        color = "#98FB98";
                    }
                }
                Button button = new Button
                {
                    Content = new TextBlock
                    {
                        Text = examName,
                        HorizontalAlignment = HorizontalAlignment.Center,
                        VerticalAlignment = VerticalAlignment.Center,
                        Margin = new Thickness(2, 5, 2, 5)
                    },
                    Margin = margin,
                    Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString(color)),
                    Foreground = Brushes.White
                };
                button.Click += (s, e) => OpenExamWindow(exam);
                Grid.SetRow(button, i / numColumns);
                Grid.SetColumn(button, i % numColumns);
                ButtonGrid.Children.Add(button);
            }
        }

        private void OpenExamWindow(Exam exam)
        {
            DoExamWindow examWindow = new DoExamWindow(exam, account);
            this.Close();
            examWindow.Show();
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            var licenseTypeWindow = new LicenseDetailWindow(licenseType, account);
            licenseTypeWindow.Show();
            this.Close();
        }
    }
}
