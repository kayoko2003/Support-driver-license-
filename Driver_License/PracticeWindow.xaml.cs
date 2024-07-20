using Driver_License.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using System.Windows.Threading;

namespace Driver_License
{
    /// <summary>
    /// Interaction logic for PracticeWindow.xaml
    /// </summary>
    public partial class PracticeWindow : Window
    {
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        private LicenseType licenseType;
        private List<Question> questions;
        private int currentQuestionIndex;
        private Dictionary<int, int> selectedAnswers;
        private int typeQuestion;
        private Account account;

        public PracticeWindow(LicenseType licenseType, int typeQuestion, Account account)
        {
            InitializeComponent();
            this.licenseType = licenseType;
            this.typeQuestion = typeQuestion;
            this.account = account;
            selectedAnswers = new Dictionary<int, int>();
            LoadQuestions();
            DisplayCurrentQuestion();
        }

        private void LoadQuestions()
        {
            questions = context.Questions
                .Where(q => q.QuestionTypeId == typeQuestion && q.IsDelete == false && q.LicenseTypes.Any(lt => lt.LicenseTypeId == licenseType.LicenseTypeId))
                .OrderBy(r => Guid.NewGuid())
                .Take(50)
                .ToList();

            if (questions.Any())
            {
                currentQuestionIndex = 0;
            }
        }

        private void DisplayCurrentQuestion()
        {
            if (questions != null && questions.Count > 0 && currentQuestionIndex >= 0 && currentQuestionIndex < questions.Count)
            {
                var currentQuestion = questions[currentQuestionIndex];
                questionNumber.Content = $"Câu hỏi {currentQuestionIndex + 1}";
                questionContent.Text = currentQuestion.Content;
                if (!string.IsNullOrEmpty(currentQuestion.Image))
                {
                    questionImg.Source = new BitmapImage(new Uri(currentQuestion.Image, UriKind.Relative));
                    questionImg.Visibility = Visibility.Visible;
                }
                else
                {
                    questionImg.Source = null;
                    questionImg.Visibility = Visibility.Collapsed;
                }

                List<Answer> answers = context.Answers.Where(a => a.QuestionId == currentQuestion.QuestionId).ToList();

                if (answers != null && answers.Count > 0)
                {
                    dgLiencesType.ItemsSource = answers;

                    // Kiểm tra và khôi phục trạng thái đáp án đã chọn
                    if (selectedAnswers.ContainsKey(currentQuestion.QuestionId))
                    {
                        int selectedAnswerId = selectedAnswers[currentQuestion.QuestionId];
                        var selectedAnswer = answers.FirstOrDefault(a => a.AnswerId == selectedAnswerId);
                        if (selectedAnswer != null)
                        {
                            dgLiencesType.SelectedItem = selectedAnswer;

                            var correctAnswer = context.Answers.FirstOrDefault(a => a.QuestionId == currentQuestion.QuestionId && a.CorrectAnswer);
                            if (correctAnswer.AnswerId != selectedAnswerId)
                            {

                            }
                        }
                    }
                }
                else
                {
                    dgLiencesType.ItemsSource = new List<Answer> { new Answer { Content = "Không có đáp án" } };
                }

                // Hiển thị hoặc ẩn nút Next và Submit dựa trên câu hỏi hiện tại
                if (currentQuestionIndex == questions.Count - 1)
                {
                    btnNext.Visibility = Visibility.Collapsed;
                    btnSubmit.Visibility = Visibility.Visible;
                }
                else
                {
                    btnNext.Visibility = Visibility.Visible;
                    btnSubmit.Visibility = Visibility.Collapsed;
                }
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            SaveSelectedAnswer();
            if (currentQuestionIndex > 0)
            {
                currentQuestionIndex--;
                DisplayCurrentQuestion();
            }
        }

        private void BtnNext_Click(object sender, RoutedEventArgs e)
        {
            SaveSelectedAnswer();
            if (currentQuestionIndex < questions.Count - 1)
            {
                currentQuestionIndex++;
                DisplayCurrentQuestion();
            }
        }

        private void BtnSubmit_Click(object sender, RoutedEventArgs e)
        {
            SaveSelectedAnswer();
            int correctAnswers = 0;

            foreach (var question in questions)
            {
                var selectedAnswerId = selectedAnswers.ContainsKey(question.QuestionId) ? selectedAnswers[question.QuestionId] : -1;

                var correctAnswer = context.Answers.FirstOrDefault(a => a.QuestionId == question.QuestionId && a.CorrectAnswer);

                var userSelect = context.Answers.FirstOrDefault(a => a.AnswerId == selectedAnswerId);
                if (selectedAnswerId == -1)
                {
                    correctAnswer.UserSelected = "Unselect";
                }
                else if (correctAnswer.AnswerId != selectedAnswerId)
                {
                    correctAnswer.UserSelected = "True";
                    userSelect.UserSelected = "False";
                }
                else
                {
                    correctAnswers++;
                    correctAnswer.UserSelected = "True";
                }
            }

            DisplayCurrentQuestion();

            btnSubmit.Visibility = Visibility.Collapsed;
            btnDoAgain.Visibility = Visibility.Visible;
            btnExplain.Visibility = Visibility.Visible;
  
            MessageBox.Show($"Bạn đã trả lời đúng {correctAnswers} trên {questions.Count} câu.\n");

        }

        private void SaveSelectedAnswer()
        {
            var selectedAnswer = dgLiencesType.SelectedItem as Answer;
            if (selectedAnswer != null)
            {
                selectedAnswers[questions[currentQuestionIndex].QuestionId] = selectedAnswer.AnswerId;
            }
        }

        private void BtnDoAgain_Click(object sender, RoutedEventArgs e)
        {
            PracticeWindow examWindow = new PracticeWindow(licenseType, typeQuestion, account);
            examWindow.Show();
            this.Close();
        }

        private void BtnExplain_Click(object sender, RoutedEventArgs e)
        {
            var currentQuestion = questions[currentQuestionIndex];
            MessageBox.Show(currentQuestion.Explain);
        }

        private void BtnOut_Click(object sender, RoutedEventArgs e)
        {
            var licenseTypeWindow = new LicenseDetailWindow(licenseType, account);
            licenseTypeWindow.Show();
            this.Close();
        }
    }
}
