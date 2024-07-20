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
using System.Windows.Threading;

namespace Driver_License
{
    /// <summary>
    /// Interaction logic for DoExamWindow.xaml
    /// </summary>
    public partial class DoExamWindow : Window
    {
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        private Exam exam;
        private List<Question> questions;
        private int currentQuestionIndex;
        private Dictionary<int, int> selectedAnswers;
        private DispatcherTimer dispatcherTimer;
        private TimeSpan time;
        private Account account;

        public DoExamWindow(Exam exam, Account account)
        {
            InitializeComponent();
            this.exam = exam;
            selectedAnswers = new Dictionary<int, int>();
            LoadQuestions();
            DisplayCurrentQuestion();
            StartTimer();
            this.account = account;
        }

        private void StartTimer()
        {
            time = TimeSpan.FromMinutes(19);

            dispatcherTimer = new DispatcherTimer();
            dispatcherTimer.Interval = TimeSpan.FromSeconds(1);
            dispatcherTimer.Tick += dispatcherTimer_Tick;
            dispatcherTimer.Start();
        }

        private void dispatcherTimer_Tick(object sender, EventArgs e)
        {
            if (time == TimeSpan.Zero)
            {
                dispatcherTimer.Stop();
                timeLabel.Content = time.ToString("Time out");
                timeLabel.Foreground = new SolidColorBrush(Colors.Red);
                BtnSubmit_Click(this, null);
            }
            else
            {
                time = time.Add(TimeSpan.FromSeconds(-1));
                timeLabel.Content = time.ToString("mm\\:ss");
            }
        }

        private void LoadQuestions()
        {
            var exams = context.Exams
                .Where(ed => ed.ExamId == exam.ExamId)
                .Include(ed => ed.Questions).ThenInclude(ed => ed.Answers).OrderBy(r => Guid.NewGuid()).ToList();

            if (exams.Any())
            {
                Exam currentExam = exams.First();

                questions = currentExam.Questions.ToList();

                foreach (var question in questions)
                {
                    foreach (var answer in question.Answers)
                    {
                        answer.UserSelected = null;
                        context.Answers.Update(answer);
                    }
                }
                context.SaveChanges();

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

            var existingResult = context.Results
                                        .FirstOrDefault(r => r.AccountId == account.AccountId && r.ExamId == exam.ExamId);

            if (existingResult != null)
            {
                existingResult.Result1 = correctAnswers;
                try
                {
                    context.Results.Update(existingResult);
                    context.SaveChanges();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Có lỗi xảy ra khi cập nhật kết quả: " + ex.Message);
                }
            }
            else
            {
                // Thêm kết quả mới nếu chưa tồn tại
                var newResult = new Result
                {
                    AccountId = account.AccountId,
                    ExamId = exam.ExamId,
                    Result1 = correctAnswers
                };

                try
                {
                    context.Results.Add(newResult);
                    context.SaveChanges();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Có lỗi xảy ra khi lưu kết quả: " + ex.Message, "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

            dispatcherTimer.Stop();
            DisplayCurrentQuestion();

            btnSubmit.Visibility = Visibility.Collapsed;
            btnDoAgain.Visibility = Visibility.Visible;
            btnExplain.Visibility = Visibility.Visible;

            string mess = correctAnswers >= 20 ? "Chúc mừng bạn đã vượt qua bài thi lý thuyết" : "Rất tiếc! bạn đã trượt kì thi lý thuyết";

            MessageBox.Show($"Bạn đã trả lời đúng {correctAnswers} trên {questions.Count} câu.\n" + mess);
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
            DoExamWindow examWindow = new DoExamWindow(exam, account);
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
            var license = context.LicenseTypes.Where(l => l.LicenseTypeId == exam.LicenseTypeId).FirstOrDefault();
            var licenseTypeWindow = new LicenseDetailWindow(license, account);
            licenseTypeWindow.Show();
            this.Close();
        }
    }
}
