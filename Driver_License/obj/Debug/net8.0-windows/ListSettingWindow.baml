   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   &     Driver_License.ListSettingWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  ListSettingWindow��5   	   $	��579��6#   $	��400��60    � WindowStartupLocation$ CenterScreen=�5	   	    � 
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
   �  � RowDefinitions 5"      �� 5#      $
��Auto �6    �� 5$      $��2 �6    �� 5%      $��* �6    �� 5&      $��30 �6    .+�5(      �� -   5         ��Name$ ButtonOpenMenu��5(      $��40��6-   $��50��69   $
��Left=�6D   $��Center=�6_   ���	#FF31577E��6{   Z� ��6�   Z� .��5)      �� $��Images/Icon/Menu.png��6   5*      �� 5+      $��Danh sách cài đặt��6   $��0��61   $��Center=�6>   $��20(�6[   $
��0,10q�6i   
���   �6w   �� 5,      $��1��6   
���   �$��0,0,0,2q�66   $��Stretch=�6P   $��Bottom=�6n   �� 5-      -   5         ��Name$ dgLiencesType��5-      $��2��6-   $��Center=�6:   $��Center=�6W   $��0q�6r   
������  5.       �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius �� Padding �� Triggers P� Property P� Value �� ScaleX �� ScaleY��%u  '��       '�� t     �� 5/      " ��6   .�50      ��  � ��$ Hidden=�6J   �� 51       � ��$ Hidden=�6H   52      �� 53      " ��6   .�54      ��  � �� 55      �� 56   "   " ��62   .R�57   &   �� #��z��6-   #��z��58   -   #��z��59   -   $ 10��5:   -   $ 5q�6?   ._�5;   *   �� $��Center=�6;   $��Center=�6X   5<   '   5=   #   5?       5@      P� 5A       �@J�IsMouseOver$
 True��6=   . �5B   "   ��  � z� 5C   &   �� 5D   *   $	 1.1Q�69   $	 1.1Q�6F   5F   #   �� 5G   "    �@J�RenderTransformOrigin$ 0.5,0.5&�6J   5H      5J      5K      .@�5L      �� .��5M      �� -   5        $��Danh sách câu hỏi��5M      $	��300��6V   $��20(�6b   $
��Bold"�6p   $��50��6�   $��10q�6�   
����� �6�   5N      �� 5O      .��5P      �� -   5        $��Danh sách đề thi��5P      $	��300��6U   $��20(�6b   $
��Bold"�6p   $��50��6�   $��10q�6�   
����� �6�   5Q      �� 5R      .��5S      �� -   5        $"��Danh sách mức xử phạt��5S      $	��300��6^   $��20(�6k   $
��Bold"�6y   $��50��6�   $��10q�6�   
����� �6�   5T      �� 5V      .��5W      �� -   5        $��Danh sách tài khoản��5W      $	��300��6[   $��20(�6h   $
��Bold"�6v   $��50��6�   $��10q�6�   
����� �6�   5X      5Y      5Z      � 5[   
   -   5         �Name$ GridMenu��5[      $��0��6!   $
��Left=�6+   ���	#FF31577E J� Effect 5\      3  -System.Windows.Media.Effects.DropShadowEffect  5]         
BlurRadius$ 2Q�6#      ShadowDepth$ 1Q�62      Color$ 	#FFAEAEAE��6B   .+�5_      �� .+�5`      � $��47��6   
������� J� RenderTransformOrigin$ 0.5,0.5&�66   z�5a      V� 5b      .~�5c      �� �� 5d      �� 5e      T� 5f      5g      .+�5i      �� -   5        $ ButtonCloseMenu��5i      $y�	Collapsed=�67   $��40��6N   $��50��6Z   $��Right=�6e   $��Center=�6�   ���	#FF31577E��6�   Z� ��6�   Z� .��5j      �� $��Images/Icon/Menu.png��6    5k      5l      �� 5m      -	   5         ��Name$ ListViewMenu��5m      ���	#FF5C99D6$��Disabled=�6H   .@�5n      �� -
   5          ��Name$  ItemPractice��5n   #   $��60��69   .��5o      �� ! �� Orientation$! 
Horizontal=�6%   .+�5p      �� $��Phân loại��6(   $��Center=�69   $��20 10q�6T   5q      5r      �� 5s      -   5        $  ItemProfile��5s   #   $��60��68   .��5t      �� $! 
Horizontal=�6%   .+�5u      �� $��Profile��6(   $��Center=�67   $��20 10q�6R   5v      5w      �� 5x      -   5        $  manage��5x   F   $��60��6#   $y�	Collapsed=�6/   
�������.��5y      �� $! 
Horizontal=�6%   .+�5z      �� $��
Quản lý��6(   $��Center=�67   $��20 10q�6S   5{      5|      5}      5~      �� 5      -   5        $��Đăng xuất��5      $��Bottom=�6)   $��Center=�6D   $	��100��6a   $��30��6m   6y   5�      5�      5�      