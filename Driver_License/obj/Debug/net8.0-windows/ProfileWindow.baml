   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   "    Driver_License.ProfileWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  ProfileWindow��5   	   $	��579��6   $	��400��6,    � WindowStartupLocation$ CenterScreen=�5	   	    � 
ResizeMode$ NoResize=�6.    � 	Resources 5
         OpenMenu �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value  	CloseMenu��%�  &	        &	 �     �� 5   
   .��5      U� $ (FrameworkElement.Width)�6,   $ GridMenu��6a   .\�5        $ 0��6'   $ 0Q�63     5      $ 0:0:0.5��6'   $	 100Q�69   5      5      �� 5   
   .��5      U� $ (FrameworkElement.Width)�6,   $ GridMenu��6a   .\�5        $ 0��6'   $	 100Q�63     5      $ 0:0:0.5��6'   $ 0Q�69   5      5      5       � Triggers 5      :� 5   
   	 :� RoutedEvent$	 ButtonBase.Click��6   
 :� 
SourceName$
 ButtonOpenMenu��66   .[�5      �� #��[  6   5      :� 5   
   $	 ButtonBase.Click��6   $
 ButtonCloseMenu��66   .[�5      �� #��[ 6   5      .��5       � .+�5!   
   � .+�5"      �� -   5         ��Name$ 	myProfile��5"      $��20q�6,   .+�5#      �� $��Profile��6   $��35(�6+   $��DemiBold"�69   $��Center=�6O   $��
0,20,0,100q�6l   �� 5$       �� Orientation$ 
Horizontal=�6   $��0,0,0,10q�66   .+�5%      �� $��Tài khoản:��6    $	��101��62   $��15(�6>   $
��Bold"�6L    �� TextAlignment$ Right=�6^   $��0,0,20,0q�6t   $��Center=�6�   �� 5&      -   5         ��Name$ UserNameTextBox��5&      $	��200��6Q   $��Center=�6]    �� 
IsReadOnly$
 True��6x   ��67   �� *
UserName+6x   5'      �� 5(      $ 
Horizontal=�6   $��0,0,0,10q�66   .+�5)      �� $��Email:��6    $	��100��6/   $��15(�6;   $
��Bold"�6I   $ Right=�6[   $��0,0,20,0q�6q   $��Center=�6�   �� 5*      -   5        $ EmailTextBox��5*      $	��200��6K   $��Center=�6W   $
 True��6r   ��64   �� *Email+6r   5+      �� 5,      $ 
Horizontal=�6   $��0,0,0,10q�66   .+�5-      �� $��Gender:��6    $	��100��6/   $��15(�6;   $
��Bold"�6I   $ Right=�6[   $��0,0,20,0q�6q   $��Center=�6�   �� 5.      $ 
Horizontal=�6!   $��Center=�6:   .+�5/      	� -   5         	�Name$ MaleRadioButton��5/   &   $
��Male��6?    	� 	GroupName$ Gender��6N   $��Center=�6a   ${�False��6|   	� 50      -   5        $ FemaleRadioButton��50   &   $��Female��6A   $ Gender��6R   $��Center=�6e   ${�False��6�   51      52      �� 53      $ 
Horizontal=�6   $��0,0,0,10q�66   .+�54      �� $��Date of Birth:��6    $	��100��67   $��15(�6C   $
��Bold"�6Q   $ Right=�6c   $��0,0,20,0q�6y   $��Center=�6�   (  "System.Windows.Controls.DatePicker  55      -   5          Name$ DobDatePicker��55   !   $	��200��68   $��Center=�6D   ${�False��6_   56      �� 57      $ 
Horizontal=�6   $��Center=�66   $��	0,20,0,10q�6S   .+�58      �� -   5        $��Đổi mật khẩu��58      $��0,0,20,0q�64   $��Center=�6F   6a   �� 59      -   5         ��Name$ 
EditButton��59      $��Chỉnh sửa��61   $��Center=�6E   6`   5:      5;      5<      �� 5=   
   -	   5        $ ButtonOpenMenu��5=      $��40��6)   $��50��65   $��5q�6@   $
��Left=�6x   $	��Top=�6�   ���	#FF31577E��6K   Z� ��6a   Z� .��5>      �� $��Images/Icon/Menu.png��6   5?      � 5A   
   -
   5         �Name$ GridMenu��5A      $��0��6!   $
��Left=�6+   ���	#FF31577E J� Effect 5B      3  -System.Windows.Media.Effects.DropShadowEffect  5C         
BlurRadius$ 2Q�6#      ShadowDepth$ 1Q�62      Color$ 	#FFAEAEAE��6B   .+�5E      �� .+�5F      � $��47��6   
������� J� RenderTransformOrigin$ 0.5,0.5&�66   z�5G      V� 5H      .~�5I      �� �� 5J      �� 5K      T� 5L      5M      .+�5O      �� -   5        $ ButtonCloseMenu��5O      $y�	Collapsed=�66   $��40��6M   $��50��6Y   $��Right=�6d   $��Center=�6�   ���	#FF31577E��6�   Z� ��6�   Z� .��5P      �� $��Images/Icon/Menu.png��6    5Q      5R      �� 5S      -   5         ��Name$ ListViewMenu��5S      ���	#FF5C99D6$��Disabled=�6H   .@�5T      �� -   5         ��Name$ ItemPractice��5T   #   $��60��69   .��5U      �� $ 
Horizontal=�6%   .+�5V      �� $��Luyện tập��6(   $��Center=�69   $��20 10q�6T   5W      5X      �� 5Y      $��60��6#   
�������.��5Z      �� $ 
Horizontal=�6%   .+�5[      �� $��Profile��6(   $��Center=�67   $��20 10q�6R   5\      5]      �� 5^      -   5        $ manage��5^   F   $��60��6#   $y�	Collapsed=�6/   .��5_      �� $ 
Horizontal=�6%   .+�5`      �� $��
Quản lý��6(   $��Center=�67   $��20 10q�6R   5a      5b      5c      5d      �� 5e      -   5        $��Đăng xuất��5e      $��Bottom=�6)   $��Center=�6D   $	��100��6a   $��30��6m   6y   5f      5g      5h      