FasdUAS 1.101.10   ��   ��    k             l     ��  ��      Configurations     � 	 	    C o n f i g u r a t i o n s   
  
 l     ����  r         m     ���� �  o      ���� 0 daystobackup daysToBackup��  ��        l    ����  r        m    ����   o      ���� 0 daystodelete daystoDelete��  ��        l    ����  r        m    	   �    E l e m e n t a l  o      ���� 0 accountname accountName��  ��        l    ����  r        m         � ! ! " E l e m e n t a l   A r c h i v e  o      ���� 0 backupmailbox backupMailbox��  ��     " # " l    $���� $ r     % & % J     ' '  ( ) ( m     * * � + + 
 I n b o x )  , - , m     . . � / /  S e n t -  0�� 0 m     1 1 � 2 2 > S y s t e m s   a n d   S u p p o r t   E n g i n e e r i n g��   & o      ���� &0 mailboxestobackup mailboxesToBackup��  ��   #  3 4 3 l   $ 5���� 5 r    $ 6 7 6 J      8 8  9 : 9 m     ; ; � < < ( J i v e / G l o b a l   S e r v i c e s :  = > = m     ? ? � @ @ 8 J i v e / S e r v i c e s   a n d   S u p p o r t   K B >  A B A m     C C � D D 6 J i v e / T e c h n i c a l   P u b l i c a t i o n s B  E�� E m     F F � G G  T i c k e t s��   7 o      ���� &0 mailboxestodelete mailboxesToDelete��  ��   4  H I H l     ��������  ��  ��   I  J K J l     �� L M��   L   Initial sets    M � N N    I n i t i a l   s e t s K  O P O l  % . Q���� Q r   % . R S R I  % *������
�� .misccurdldt    ��� null��  ��   S o      ���� 0 
filterdate 
filterDate��  ��   P  T U T l  / < V���� V r   / < W X W \   / 8 Y Z Y o   / 2���� 0 
filterdate 
filterDate Z ]   2 7 [ \ [ o   2 3���� 0 daystobackup daysToBackup \ 1   3 6��
�� 
days X o      ���� *0 desireddaystobackup desiredDaysToBackup��  ��   U  ] ^ ] l  = J _���� _ r   = J ` a ` \   = F b c b o   = @���� 0 
filterdate 
filterDate c ]   @ E d e d o   @ A���� 0 daystodelete daystoDelete e 1   A D��
�� 
days a o      ���� *0 desireddaystodelete desiredDaysToDelete��  ��   ^  f g f l     ��������  ��  ��   g  h i h l     �� j k��   j   Mail handling    k � l l    M a i l   h a n d l i n g i  m�� m w       n o n l  KY p���� p O   KY q r q k   QX s s  t u t l  Q Q�� v w��   v 6 0 First we will iterate over the backup mailboxes    w � x x `   F i r s t   w e   w i l l   i t e r a t e   o v e r   t h e   b a c k u p   m a i l b o x e s u  y z y X   Q � {�� | { k   e � } }  ~  ~ r   e t � � � n   e p � � � 4   k p�� �
�� 
mbxp � o   n o���� "0 mailboxtobackup mailboxToBackup � 4   e k�� �
�� 
mbxp � o   i j���� 0 backupmailbox backupMailbox � o      ���� &0 thisbackupmailbox thisBackupMailbox   � � � r   u � � � � n   u � � � � 4   { ��� �
�� 
mbxp � o   ~ ���� "0 mailboxtobackup mailboxToBackup � 4   u {�� �
�� 
mact � o   y z���� 0 accountname accountName � o      ���� 0 thismailbox thisMailbox �  � � � l  � ��� � ���   � V P The steps below are necessary in order to iterate in reverse over the messages.    � � � � �   T h e   s t e p s   b e l o w   a r e   n e c e s s a r y   i n   o r d e r   t o   i t e r a t e   i n   r e v e r s e   o v e r   t h e   m e s s a g e s . �  � � � l  � ��� � ���   � O I This is required because of how Mail and AppleScript handle message IDs.    � � � � �   T h i s   i s   r e q u i r e d   b e c a u s e   o f   h o w   M a i l   a n d   A p p l e S c r i p t   h a n d l e   m e s s a g e   I D s . �  � � � l  � ��� � ���   � ] W First they get the count of messages in the mailbox and the messages' IDs range from 1    � � � � �   F i r s t   t h e y   g e t   t h e   c o u n t   o f   m e s s a g e s   i n   t h e   m a i l b o x   a n d   t h e   m e s s a g e s '   I D s   r a n g e   f r o m   1 �  � � � l  � ��� � ���   � X R to this count number. Then, as Mail backs up each message, the number of messages    � � � � �   t o   t h i s   c o u n t   n u m b e r .   T h e n ,   a s   M a i l   b a c k s   u p   e a c h   m e s s a g e ,   t h e   n u m b e r   o f   m e s s a g e s �  � � � l  � ��� � ���   � N H in that folder decreases and Mail returns errors for the last messages.    � � � � �   i n   t h a t   f o l d e r   d e c r e a s e s   a n d   M a i l   r e t u r n s   e r r o r s   f o r   t h e   l a s t   m e s s a g e s . �  � � � r   � � � � � m   � �����  � o      ����  0 firstmessageid firstMessageID �  � � � r   � � � � � I  � ��� ���
�� .corecnte****       **** � n  � � � � � 2  � ���
�� 
mssg � o   � ����� 0 thismailbox thisMailbox��   � o      ���� 0 lastmessageid lastMessageID �  � � � l  � ��� � ���   �   Iterating in reverse    � � � � *   I t e r a t i n g   i n   r e v e r s e �  ��� � Y   � � ��� � � � � k   � � � �  � � � l  � ��� � ���   � ? 9 Associate (or retrieve) the message with the desired ID.    � � � � r   A s s o c i a t e   ( o r   r e t r i e v e )   t h e   m e s s a g e   w i t h   t h e   d e s i r e d   I D . �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
mssg � o   � ����� 0 withcurrentid withCurrentID � o   � ����� 0 thismailbox thisMailbox � o      ���� 0 thismessage thisMessage �  � � � l  � ��� � ���   � . ( Check if we have to backup this message    � � � � P   C h e c k   i f   w e   h a v e   t o   b a c k u p   t h i s   m e s s a g e �  ��� � Z   � � � ����� � A  � � � � � n  � � � � � 1   � ���
�� 
rdrc � o   � ����� 0 thismessage thisMessage � o   � ����� *0 desireddaystobackup desiredDaysToBackup � r   � � � � � o   � ����� &0 thisbackupmailbox thisBackupMailbox � n      � � � m   � ���
�� 
mbxp � o   � ����� 0 thismessage thisMessage��  ��  ��  �� 0 withcurrentid withCurrentID � o   � ����� 0 lastmessageid lastMessageID � o   � �����  0 firstmessageid firstMessageID � m   � ���������  �� "0 mailboxtobackup mailboxToBackup | o   T U���� &0 mailboxestobackup mailboxesToBackup z  � � � l  � ��� � ���   � $  Now let's delete our messages    � � � � <   N o w   l e t ' s   d e l e t e   o u r   m e s s a g e s �  ��� � X   �X ��� � � k   �S � �  � � � r   � � � � n   � � � � � 4   � ��� �
�� 
mbxp � o   � ����� "0 mailboxtodelete mailboxToDelete � 4   � ��� �
�� 
mact � o   � ����� 0 accountname accountName � o      ���� 0 thismailbox thisMailbox �  � � � r  	 � � � m  ����  � o      ����  0 firstmessageid firstMessageID �  � � � r  
 � � � I 
�� ���
�� .corecnte****       **** � n 
 � � � 2 ��
�� 
mssg � o  
���� 0 thismailbox thisMailbox��   � o      ���� 0 lastmessageid lastMessageID �  ��� � Y  S ��� � � � � k  (N � �  � � � r  (4 � � � n  (0 �  � 4  +0��
�� 
mssg o  ./���� 0 withcurrentid withCurrentID  o  (+���� 0 thismailbox thisMailbox � o      ���� 0 thismessage thisMessage � �� Z  5N���� A 5@ n 5< 1  8<��
�� 
rdrc o  58���� 0 thismessage thisMessage o  <?���� *0 desireddaystodelete desiredDaysToDelete I CJ��	��
�� .coredelonull���     obj 	 o  CF�� 0 thismessage thisMessage��  ��  ��  ��  �� 0 withcurrentid withCurrentID � o   �~�~ 0 lastmessageid lastMessageID � o   #�}�}  0 firstmessageid firstMessageID � m  #$�|�|����  �� "0 mailboxtodelete mailboxToDelete � o   � ��{�{ &0 mailboxestodelete mailboxesToDelete��   r m   K N

�                                                                                  emal  alis    F  Macintosh HD               ����H+  4��Mail.app                                                       5���{d        ����  	                Applications    ��$�      �꥔    4��  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��  ��   o�                                                                                  emal  alis    F  Macintosh HD               ����H+  4��Mail.app                                                       5���{d        ����  	                Applications    ��$�      �꥔    4��  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��       �z�z   �y
�y .aevtoappnull  �   � **** �x�w�v�u
�x .aevtoappnull  �   � **** k    Y  
        "  3  O  T  ]  n�t�t  �w  �v   �s�r�q�s "0 mailboxtobackup mailboxToBackup�r 0 withcurrentid withCurrentID�q "0 mailboxtodelete mailboxToDelete %�p�o�n�m �l  �k * . 1�j ; ? C F�i�h�g�f�e�d�c
�b�a�`�_�^�]�\�[�Z�Y�X�W�V�p ��o 0 daystobackup daysToBackup�n �m 0 daystodelete daystoDelete�l 0 accountname accountName�k 0 backupmailbox backupMailbox�j &0 mailboxestobackup mailboxesToBackup�i �h &0 mailboxestodelete mailboxesToDelete
�g .misccurdldt    ��� null�f 0 
filterdate 
filterDate
�e 
days�d *0 desireddaystobackup desiredDaysToBackup�c *0 desireddaystodelete desiredDaysToDelete
�b 
kocl
�a 
cobj
�` .corecnte****       ****
�_ 
mbxp�^ &0 thisbackupmailbox thisBackupMailbox
�] 
mact�\ 0 thismailbox thisMailbox�[  0 firstmessageid firstMessageID
�Z 
mssg�Y 0 lastmessageid lastMessageID�X 0 thismessage thisMessage
�W 
rdrc
�V .coredelonull���     obj �uZ�E�O�E�O�E�O�E�O���mvE�O����a vE` O*j E` O_ �_  E` O_ �_  E` Oa 	 ��[a a l kh  *a �/a �/E` O*a �/a �/E` OkE` O_ a  -j E` !O <_ !_ ih _ a  �/E` "O_ "a #,_  _ _ "a ,FY h[OY��[OY��O y_ [a a l kh *a �/a �/E` OkE` O_ a  -j E` !O 8_ !_ ih _ a  �/E` "O_ "a #,_  _ "j $Y h[OY��[OY��U ascr  ��ޭ