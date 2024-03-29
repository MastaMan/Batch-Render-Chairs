/ *      
 [ I N F O ]    
 N A M E   =   B a t c h   R e n d e r   C h a i r s  
 V E R S I O N   =   1 . 0 . 9  
 A U T H O R   =   M a s t a M a n  
 D E V   =   h t t p s : / / 3 d g r o u n d . n e t  
 C L I E N T = S h e s t a k o v i c h  
 H E L P   =    
 [ 1 . 0 . 0 ]  
 *   I n i t i a l   r e l e a s e   =  
  
 [ 1 . 0 . 1 ]  
 -   B u g F i x :   A s s i g n   m a t e r i a l s =  
  
 [ 1 . 0 . 2 ]  
 *   C h a n g e d :   R o t a t a t i o n   d e g r e e s =  
  
 [ 1 . 0 . 3 ]  
 +   A d d e d :   R e n d e r   o p t i o n   f o r   r e n d e r   a l l   t u r n s   o r   o n l y   s p e c i f i c =  
  
  
 [ 1 . 0 . 4 ]  
 +   A d d e d :   A u t o   W e l d   v e r t e x e s   f e a t u r e =  
  
 [ 1 . 0 . 5 ]  
 *   C h a n g e d :   C h a n g e d   r o t a t e   d i r e c t i o n s =  
  
 [ 1 . 0 . 6 ]  
 *   C h a n g e d :   D r o p d o w n   w i t h   a n g l e s   t o   c h e c k b o x e s =  
  
 [ 1 . 0 . 7 ]  
 +   A d d e d :   S u p p o r t   f o r m a t s   f b x ,   3 d s ,   o b j =  
 +   A d d e d :   S e t   p a t h   f o r   R e n d e r   E l e m e n t s =  
  
 [ 1 . 0 . 8 ]  
 +   A d d e d :   S u p p o r t   c a m e r a s =  
  
 [ 1 . 0 . 9 ]  
 -   B u g F i x :   V i e w s   e r r o r =  
  
 [ A B O U T ]  
 T h i s   s c r i p t   a u t o m a t e   r e n d e r i n g   c h a i r s   ( O n l y   C o r o n a   R e n d e r e r ) =  
 L o a d   3 d s   i n   t o   s c e n e ,   t h e n   a p p l y   m a t e r i a l s   f r o m   s p h e r e s   i n s t e a d   s a m e   n a m e   3 D S   o b j e c t s   m a t e r i a l s ,   t h e n   r o t a t e   4 5 ,   9 0 ,   1 8 0   d e g   a n d   r e n d e r =  
  
 [ S C R I P T ]  
 * /  
  
 - -   F i l e P r o p e r t i e s   b a s e d   s e t t i n g s   s y s t e m  
 s t r u c t   ' $ '   (  
         f n   a d d   n   v   =   (  
                 r e t u r n   ( f i l e P r o p e r t i e s . a d d P r o p e r t y   # c u s t o m   n   v )  
         ) ,  
         f n   g e t   n   =   (  
                 i   =   f i l e P r o p e r t i e s . f i n d P r o p e r t y   # c u s t o m   n  
                 i f ( i   ! =   0 )   d o   (  
                         v   =   f i l e P r o p e r t i e s . g e t P r o p e r t y V a l u e   # c u s t o m   i  
                         i f ( v [ 1 ]   = =   " # " )   d o   r e t u r n   e x e c u t e ( v )  
                         r e t u r n   v  
                 )  
                 r e t u r n   u n d e f i n e d  
         ) ,  
         f n   d e l   n   =   (  
                 f i l e P r o p e r t i e s . d e l e t e P r o p e r t y   # c u s t o m   n  
         ) ,  
         f n   l i s t   t :   # f u l l   =   (  
                 p   =   f i l e P r o p e r t i e s . g e t N u m P r o p e r t i e s   # c u s t o m  
                 r e s   =   # ( )  
                 f o r   i   i n   1   t o   ( f i l e P r o p e r t i e s . g e t N u m P r o p e r t i e s   # c u s t o m )   d o   (  
                         n   =   f i l e P r o p e r t i e s . g e t P r o p e r t y N a m e   # c u s t o m   i  
                         v   =   f i l e P r o p e r t i e s . g e t P r o p e r t y V a l u e   # c u s t o m   i  
                          
                         c a s e   t   o f   (  
                                 # n a m e s :   a p p e n d   r e s   n  
                                 # v a l u e s :   a p p e n d   r e s   v  
                                 d e f a u l t :   a p p e n d   r e s   # ( n ,   v )  
                         )  
                 )  
                  
                 r e t u r n   r e s  
         )  
 )  
  
 t r y ( c l o s e R o l l o u t F l o a t e r   f B a t c h R e n d e r C h a i r s )   c a t c h ( )  
 g l o b a l   f B a t c h R e n d e r C h a i r s   =   n e w R o l l o u t F l o a t e r   " B a t c h   R e n d e r   C h a i r s "   2 8 0   5 0 0  
  
 g l o b a l   _ _ C A M E R A S   =   # ( )  
  
 r o l l o u t   _ r S t e p M a i n B R C     " M a i n "   ( 	  
 	 g r o u p   " A u t o   W e l d "   (  
 	 	 c h e c k b o x   c b x A u t o W e l d   " A u t o   W e l d "   c h e c k e d :   t r u e  
 	 	 s p i n n e r   s p n W e l d V a l u e   " W e l d   T h r e s h o l d : "   r a n g e :   [ 0 . 0 ,   1 0 0 0 ,   0 . 0 0 1 ]   f i e l d W i d t h :   7 0   t y p e :   # f l o a t   a l i g n :   # l e f t  
 	 )  
 	 g r o u p   " V i e w s "   (  
 	 	 l i s t b o x   l b x C a m e r a s   " C a m e r a s : "   a l i g n :   # l e f t   h e i g h t :   5  
 	 	 c h e c k b o x   c b x V i e w 0   " 0   d e g "   c h e c k e d :   t r u e  
 	 	 c h e c k b o x   c b x V i e w 4 5   " 4 5   d e g "   c h e c k e d :   t r u e  
 	 	 c h e c k b o x   c b x V i e w 9 0   " 9 0   d e g "   c h e c k e d :   t r u e  
 	 	 c h e c k b o x   c b x V i e w 1 8 0   " 1 8 0   d e g "   c h e c k e d :   t r u e  
 	 )  
 	 g r o u p   " M e r g e   M o d e l s   F r o m "   (  
                 e d i t t e x t   e d t M e r g e M o d e l P a t h   " "   r e a d o n l y :   t r u e   a c r o s s :   2   a l i g n :   # l e f t   f i e l d w i d t h :   1 9 5  
                 b u t t o n   b t n M e r g e M o d e l P a t h   " . . . "   w i d t h :   3 5     a l i g n :   # r i g h t   o f f s e t :   [ 0 ,   - 3 ]  
         )  
  
         g r o u p   " S a v e   O u t p u t   R e n d e r s "   (  
                 e d i t t e x t   e d t B a t c h R e n d e r P a t h   " "   r e a d o n l y :   t r u e   a c r o s s :   2   a l i g n :   # l e f t   f i e l d w i d t h :   1 9 5  
                 b u t t o n   b t n S e t B a t c h R e n d e r P a t h   " . . . "   w i d t h :   3 5     a l i g n :   # r i g h t   o f f s e t :   [ 0 ,   - 3 ]  
         )  
          
         b u t t o n   b t n S t a r t R e n d e r   " S t a r t   B a t c h   R e n d e r "   h e i g h t :   3 5   w i d t h :   2 4 0   o f f s e t :   [ 0 ,   1 0 ]  
 	  
 	 f n   g e t C b x V i e w   =   (  
 	 	 r e t u r n   f o r   i   i n   _ r S t e p M a i n B R C . c o n t r o l s   w h e r e   i . n a m e   ! =   u n d e f i n e d   a n d     m a t c h P a t t e r n   ( i . n a m e )   p a t t e r n :   " c b x V i e w * "   c o l l e c t   i  
 	 )  
 	  
 	 f n   s e t V i e w P r o p   =   (  
 	 	 n   =   l b x C a m e r a s . s e l e c t e d  
 	 	 c   =   g e t N o d e B y N a m e   n   e x a c t :   t r u e   a l l :   f a l s e  
 	 	  
 	 	 i f ( c   = =   u n d e f i n e d )   d o   r e t u r n   m e s s a g e B o x   " W r o n g   c a m e r a ! "   t i t l e :   " E r r o r ! "  
 	 	  
 	 	 v   =   # ( )  
 	 	 c c   =   g e t C b x V i e w ( )  
 	 	  
 	 	 v   =   f o r   i   i n   c c   c o l l e c t   i . c h e c k e d  
 	 	  
 	 	 s e t U s e r P r o p   c   " v i e w s "   v  
 	 )  
 	  
 	 f n   g e t V e w C a m e r a P r o p   c   =   (  
 	 	 v   =   g e t U s e r P r o p   c   " v i e w s "  
 	 	 i f ( v   ! =   u n d e f i n e d   a n d   v [ 1 ]   = =   " # " )   d o   r e t u r n   e x e c u t e   v  
 	 	 r e t u r n   # ( )  
 	 )  
 	  
 	 f n   l o a d V i e w P r o p   =   (  
 	 	 c c   =   g e t C b x V i e w ( )  
 	 	 f o r   i   i n   c c   d o   (  
 	 	 	 i . c h e c k e d   =   f a l s e  
 	 	 	 i . e n a b l e d   =   f a l s e  
 	 	 )  
 	 	  
 	 	 n   =   l b x C a m e r a s . s e l e c t e d  
 	 	 i f ( n   = =   u n d e f i n e d )   d o   r e t u r n   u n d e f i n e d  
 	 	  
 	 	 c   =   g e t N o d e B y N a m e   n   e x a c t :   t r u e   a l l :   f a l s e  
 	 	  
 	 	 i f ( c   = =   u n d e f i n e d )   d o   r e t u r n   u n d e f i n e d  
 	 	  
 	 	 v   =   g e t V e w C a m e r a P r o p   c  
  
 	 	 o u t   =   # ( )  
 	 	  
 	 	 f o r   i   i n   1   t o   c c . c o u n t   d o   (  
 	 	 	 c c [ i ] . e n a b l e d   =   t r u e  
 	 	 	 c c [ i ] . c h e c k e d   =   v [ i ]   = =   t r u e  
 	 	 	 o u t [ i ]   =   c c [ i ] . c h e c k e d  
 	 	 )  
 	 	  
 	 	 r e t u r n   t r u e  
 	 )  
 	 	  
 	 o n   l b x C a m e r a s   s e l e c t e d     v   d o   l o a d V i e w P r o p ( )  
 	  
 	 o n   c b x V i e w 0   c h a n g e d   v   d o   s e t V i e w P r o p ( )  
 	 o n   c b x V i e w 4 5   c h a n g e d   v   d o   s e t V i e w P r o p ( )  
 	 o n   c b x V i e w 9 0   c h a n g e d   v   d o   s e t V i e w P r o p ( )  
 	 o n   c b x V i e w 1 8 0   c h a n g e d   v   d o   s e t V i e w P r o p ( )  
 	  
 	 o n   c b x A u t o W e l d   c h a n g e d   v   d o   (  
 	 	 s p n W e l d V a l u e . e n a b l e d   =   v  
 	 )  
 	  
 	 f n   g e t S a v e D i r   t y p e :   " j p g "   =   (  
                 t y p e   =   ( t o U p p e r   t y p e )   + "   ( * . "   +   t y p e   +   " ) | * . "   +   t y p e  
                 f   =   g e t S a v e F i l e N a m e   f i l e n a m e :   " D O   N O T   C H A N G E   N A M E "   c a p t i o n : " S a v e   F i l e "   t y p e s :   t y p e  
                 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f  
                  
                 p   =   g e t F i l e N a m e P a t h   f  
  
                 r e t u r n   p  
         )  
 	  
 	 f n   l o a d A d d i t i o n a l S e t t i n g s   =   (  
                 s   =   ' $ ' ( )  
                  
                 p 1   =   s . g e t   " M E R G E _ M O D E L S _ P A T H "  
                 i f ( p 1   ! =   u n d e f i n e d   a n d   d o e s F i l e E x i s t   p 1 )   d o   e d t M e r g e M o d e l P a t h . t e x t   =   p 1  
                  
                 p 2   =   s . g e t   " O U T _ R E N D E R _ P A T H "  
                 i f ( p 2   ! =   u n d e f i n e d   a n d   d o e s F i l e E x i s t   p 2 )   d o   e d t B a t c h R e n d e r P a t h . t e x t   =   p 2  
         )  
 	  
 	 f n   i s C o r o n a   =   (  
                 r   =   r e n d e r e r s . c u r r e n t  
                 i f ( m a t c h P a t t e r n   ( r   a s   s t r i n g )   p a t t e r n :   " * C o r o n a R e n d e r e r * " )   d o   r e t u r n   r  
                 r e t u r n   u n d e f i n e d  
         )  
 	  
 	 f n   f o r c e U n g r o u p   o   =   (  
                 o   =   o   a s   a r r a y  
                 i f ( o . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
  
                 f o r   i   i n   o   w h e r e   i s G r o u p H e a d   i   a n d   i s V a l i d N o d e   i   d o   e x p l o d e G r o u p   i  
         )  
          
         f n   f o r c e D e l e t e O b j e c t s   o   =   (  
                 o   =   o   a s   a r r a y  
                 i f ( o . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
  
                 o o   =   f o r   i   i n   o   w h e r e   i s V a l i d N o d e   i   a n d   n o t   i s D e l e t e d   i   c o l l e c t   i  
                 d e l e t e   o o  
         )  
 	  
 	 f n   g e t C e n t e r O f M o d e l   o b j s   =   (  
 	 	 f o r   i   i n   o b j s   w h e r e   i s G r o u p H e a d   i   d o   r e t u r n   i . p o s  
 	 	 r e t u r n   o b j s . c e n t e r  
 	 )  
 	  
 	 f n   s e t R e n d e r E l e m e n t P a t h   f i l e N a m e   =   (  
 	 	 r e M g r   =   m a x O p s . g e t C u r R e n d e r E l e m e n t M g r ( )  
  
 	 	 p   =   g e t F i l e N a m e P a t h   f i l e N a m e  
 	 	 n n   =   g e t F i l e n a m e F i l e   f i l e N a m e  
 	 	 e x t   =   g e t F i l e n a m e T y p e   f i l e N a m e  
 	 	  
 	 	 f o r   i   i n   1   t o   r e M g r . N u m R e n d e r E l e m e n t s ( )   d o   (  
 	 	 	 i d   =   i   -   1  
 	 	 	 e l   =   r e M g r . G e t R e n d e r E l e m e n t   i d  
 	 	 	 i f ( e l   = =   u n d e f i n e d )   d o   c o n t i n u e  
 	 	 	 e l . e n a b l e d   =   t r u e  
 	 	 	 e n   =   e l . e l e m e n t N a m e  
 	 	 	 l o c a l   f   =   p   +   n n   +   " _ "   +   e n   +   " _ "   +   ( i   a s   s t r i n g )   +   e x t  
 	 	 	 r e M g r . S e t R e n d e r E l e m e n t F i l e n a m e   i d   f  
 	 	 )  
 	 )  
 	  
 	 f n   s e t u p R e n d e r   f i l e N a m e   i s S e l e c t e d M o d e :   f a l s e   =   (  
 	 	 c r   =   i s C o r o n a ( )  
 	 	  
 	 	 d e l e t e F i l e   f i l e N a m e  
 	 	  
 	 	 i f ( r e n d e r S c e n e D i a l o g . i s O p e n ( ) )   d o   r e n d e r S c e n e D i a l o g . c l o s e ( )   	 	  
 	 	 	  
 	 	 r e n d S a v e F i l e   =   t r u e  
 	 	 r e n d O u t p u t F i l e n a m e   =   f i l e N a m e  
 	 	 r e n d T i m e T y p e   =   1  
 	 	 c r . r e n d e r S e l e c t e d _ m o d e   =   i f ( i s S e l e c t e d M o d e )   t h e n   1   e l s e   0  
 	 	 c r . v f b _ c l e a r B e t w e e n R e n d e r s   =   t r u e  
 	 	 r e M g r   =   m a x O p s . g e t C u r R e n d e r E l e m e n t M g r ( )  
 	 	 r e M g r . S e t E l e m e n t s A c t i v e   t r u e  
 	 	 	  
 	 	 s e t R e n d e r E l e m e n t P a t h   f i l e N a m e  
  
 	 	 r e n d e r S c e n e D i a l o g . u p d a t e ( )  
 	 )  
 	  
 	 o n   _ r S t e p M a i n B R C   o p e n   d o   (  
 	 	 l o a d A d d i t i o n a l S e t t i n g s ( )  
 	 	 	  
 	 	 _ _ C A M E R A S   =   f o r   i   i n   c a m e r a s   a s   a r r a y   w h e r e   c l a s s O f   i   ! =   T a r g e t o b j e c t   c o l l e c t   i  
 	 	 l b x C a m e r a s . i t e m s   =   f o r   i   i n   _ _ C A M E R A S   c o l l e c t   i . n a m e  
 	 	 	  
 	 	 l o a d V i e w P r o p ( )  
 	 )  
 	  
 	 o n   b t n M e r g e M o d e l P a t h   p r e s s e d   d o   (  
                 p   =   g e t S a v e D i r   t y p e :   " 3 d s "  
                 i f ( p   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 ( ' $ ' ) . a d d   " M E R G E _ M O D E L S _ P A T H "   p  
                  
                 l o a d A d d i t i o n a l S e t t i n g s ( )  
         )  
 	  
 	 o n   b t n S e t B a t c h R e n d e r P a t h   p r e s s e d   d o   (  
                 p   =   g e t S a v e D i r   t y p e :   " p n g "  
                 i f ( p   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 ( ' $ ' ) . a d d   " O U T _ R E N D E R _ P A T H "   p  
                  
                 l o a d A d d i t i o n a l S e t t i n g s ( )  
         )  
 	  
 	 f n   g e t M o d e l M a t e r i a l s   n   =   (  
 	 	 n   =   t r i m R i g h t   n   " 0 1 2 3 4 5 6 7 8 9 "  
                 r e t u r n   f o r   i   i n   ( o b j e c t s   a s   a r r a y )   w h e r e   c l a s s O f   i   = =   S p h e r e   a n d   ( m a t c h P a t t e r n   ( i . n a m e )   p a t t e r n :   ( n   +   " * " ) )   c o l l e c t   i  
         )  
 	  
 	 f n   a s s i g n A l l M a t e r i a l s   c u r r e n t M o d e l   m a t e r i a l s L i s t   =   (  
 	 	 o u t   =   # ( )  
 	  
 	 	 d e f M a t   =   C o r o n a M t l ( )  
 	 	 d e f M a t . c o l o r D i f f u s e   =   c o l o r   2 5 5   0   0  
 	 	  
 	 	 f o r   i   i n   1   t o   c u r r e n t M o d e l . c o u n t   d o   (  
 	 	 	 o   =   c u r r e n t M o d e l [ i ]  
 	 	 	 o u t [ i ]   =   # ( o ,   u n d e f i n e d )  
 	 	 	 i f ( o . m a t e r i a l   = =   u n d e f i n e d )   d o   (  
 	 	 	 	 p r i n t   ( " M a t e r i a l   n o t   a s s i g n e d   t o   3 D S   m o d e l   p a r t :   "   +   o . n a m e )  
 	 	 	 	 c o n t i n u e  
 	 	 	 )  
 	 	 	 n   =   t o L o w e r   ( t r i m R i g h t   o . m a t e r i a l . n a m e   " 0 1 2 3 4 5 6 7 8 9 " )  
 	 	 	  
 	 	 	 f o r   m   i n   m a t e r i a l s L i s t   d o   ( 	 	 	 	 	 	 	  
 	 	 	 	 n n   =   t o L o w e r   ( t r i m R i g h t   m . n a m e   " 0 1 2 3 4 5 6 7 8 9 " ) 	 	 	 	  
 	 	 	 	 i f ( n   = =   n n )   d o   ( 	 	 	 	 	 	  
 	 	 	 	 	 o u t [ i ]   =   # ( o ,   m . m a t e r i a l )  
 	 	 	 	 	 e x i t  
 	 	 	 	 )    
 	 	 	 )  
 	 	 )  
 	 	  
 	 	 f o r   i   i n   o u t   d o   (  
 	 	 	 o   =   i [ 1 ]  
 	 	 	 m   =   i [ 2 ]  
 	 	 	 o . m a t e r i a l   =   m  
 	 	 	 i f ( m   = =   u n d e f i n e d )   d o   (  
 	 	 	 	 o . m a t e r i a l   =   d e f M a t  
 	 	 	 	 p r i n t   ( " N o t   f o u n d   m a t e r i a l   p a i r   i n   t h e   s c e n e   f o r   o b j e c t :   "   +   o . n a m e   +   " !   A p p l i e d   d e f a u l t   m a t e r i a l ! " )  
 	 	 	 	 c o n t i n u e  
 	 	 	 )    
 	 	 )  
 	 )  
 	  
 	 f n   b a t c h R e n d e r   c u r r e n t M o d e l   p t h   m o d e l N a m e   f r a m e   c a m   =   (  
 	 	 v i e w p o r t . s e t C a m e r a   c a m  
 	 	 t m p   =   p t h   +   m o d e l N a m e   +   " _ "   +   c a m . n a m e   +   " _ "   +   f r a m e [ 1 ]   +   " . p n g " 	 	  
 	 	 s e t u p R e n d e r   t m p   i s S e l e c t e d M o d e :   f a l s e  
 	 	  
 	 	 p r i n t   ( " R e n d e r   t h e :   "   +   t m p )  
 	 	 m a x   q u i c k   r e n d e r  
 	 )  
 	  
 	 f n   a u t o W e l d   v a l   =   (  
 	 	 i f ( s e l e c t i o n . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 f o r   o   i n   s e l e c t i o n   w h e r e   i s V a l i d N o d e   o   a n d   n o t   i s D e l e t e d   o   a n d   c a n C o n v e r t T o   o   E d i t a b l e _ P o l y   d o   (  
 	 	 	 c o n v e r t T o   o   E d i t a b l e _ P o l y  
 	 	 	  
 	 	 	 o . E d i t a b l e P o l y . S e t S e l e c t i o n   # V e r t e x   # { 1 . . ( o . v e r t s . c o u n t ) }  
 	 	 	 o . w e l d T h r e s h o l d   =   v a l  
 	 	 	 o . E d i t a b l e P o l y . w e l d F l a g g e d V e r t i c e s   ( )  
 	 	 	 o . E d i t a b l e P o l y . S e t S e l e c t i o n   # V e r t e x   # { 1 . . 1 }  
 	 	 ) 	  
 	 	  
 	 	 r e t u r n   t r u e  
 	 )  
 	  
 	 o n   b t n S t a r t R e n d e r   p r e s s e d   d o   ( 	  
                 c r   =   i s C o r o n a ( )  
                 i f ( c r   = =   u n d e f i n e d )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   a s s i g n   C o r o n a   R e n d e r e r ! "   t i t l e :   " E r r o r ! "  
  
                 o r i g M a x F i l e   =   m a x F i l e P a t h   +   m a x F i l e N a m e  
 	 	  
 	 	 i f ( o r i g M a x F i l e   = =   " " )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   s a v e   t h e   s c e n e ! "   t i t l e :   " E r r o r ! "  
 	 	  
 	 	 i f ( _ _ C A M E R A S . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " N o   c a m e r a s   f o u n d   i n   t h e   s c e n e ! "   t i t l e :   " E r r o r ! "  
 	 	 f o r   c a m   i n   _ _ C A M E R A S   d o   (  
 	 	 	 v i e w s   =   g e t V e w C a m e r a P r o p   c a m  
 	 	 	 v i e w s   =   m a k e U n i q u e A r r a y   v i e w s  
 	 	 	 m   =   " P l e a s e   c h e c k   a t   l e a s t   o n   v i e w   o p t i o n   f o r   c a m e r a :   "   +   c a m . n a m e  
 	 	 	 i f ( v i e w s . c o u n t   = =   0   o r   ( v i e w s . c o u n t   = =   1   a n d   v i e w s [ 1 ]   = =   f a l s e ) )   d o   r e t u r n   m e s s a g e B o x   m   t i t l e :   " E r r o r ! "  
 	 	 )  
 	 	  
                 c h e c k F o r S a v e ( )  
 	 	  
 	 	 f r a m e s   =   # ( )  
 	 	  
 	 	 p r e d e f i n e d F r a m e s   =   # ( )  
 	 	 a p p e n d   p r e d e f i n e d F r a m e s   # ( " 0 d e g " ,   0 )  
 	 	 a p p e n d   p r e d e f i n e d F r a m e s   # ( " 4 5 d e g " ,   - 4 5 )  
 	 	 a p p e n d   p r e d e f i n e d F r a m e s   # ( " 9 0 d e g " ,   - 9 0 )  
 	 	 a p p e n d   p r e d e f i n e d F r a m e s   # ( " 1 8 0 d e g " ,   - 1 8 0 )  
  
 	 	 s   =   ( ' $ ' )  
                 p 1   =   s . g e t   " M E R G E _ M O D E L S _ P A T H "  
                 p 2   =   s . g e t   " O U T _ R E N D E R _ P A T H "  
                  
                 i f ( p 1   = =   u n d e f i n e d   o r   n o t   d o e s F i l e E x i s t   p 1 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   c h o o s e   M e r g e   M o d e l s   P a t h ! "   t i t l e :   " E r r o r ! "  
                 i f ( p 2   = =   u n d e f i n e d   o r   n o t   d o e s F i l e E x i s t   p 2 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   c h o o s e   S a v e   O u t p u t   R e n d e r   P a t h "   t i t l e :   " E r r o r ! "  
 	 	  
 	 	 f o r m a t s   =   # ( " * . f b x " ,   " * . 3 d s " ,   " * . o b j " )  
 	 	 f i l e s   =   # ( ) 	 	  
 	 	 f o r   j j   i n   f o r m a t s   d o   j o i n   f i l e s   ( g e t F i l e s ( p 1   +   j j ) )  
 	 	  
 	 	 i f ( f i l e s . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " N o t   f o u n d   3 D S   m o d e l s   i n   f o l d e r ! "   t i t l e :   " E r r o r ! "  
 	 	 - -   D e t e c t   m a t e r i a l s  
 	 	 m a t e r i a l s L i s t   =   f o r   i   i n   o b j e c t s   w h e r e   c l a s s O f   i   = =   S p h e r e   a n d   i . m a t e r i a l   ! = u n d e f i n e d   c o l l e c t   i  
 	 	 i f ( m a t e r i a l s L i s t . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   ( " N o t   f o u n d   m a t e r i a l s   i n   r e n d e r   s c e n e :   "   +   m a x F i l e N a m e   +   " \ " ! " )   t i t l e :   " E r r o r ! "  
 	 	 	  
 	 	 p r o g r e s s S t a r t   " I n   p r o c e s s . . . "  
                 e s c a p e E n a b l e   =   t r u e  
                 c l e a r L i s t e n e r ( )  
 	 	  
 	 	 a c t i o n M a n . e x e c u t e A c t i o n   0   " 4 0 4 7 2 "  
 	 	  
 	 	 f o r   i   i n   1   t o   f i l e s . c o u n t   d o   (  
                         f   =   f i l e s [ i ]  
 	 	 	 i m p o r t F i l e   f   # n o P r o m p t      
 	 	 	  
 	 	 	 i f ( c b x A u t o W e l d . c h e c k e d )   d o   a u t o W e l d   ( s p n W e l d V a l u e . v a l u e )  
 	 	 	  
                         c u r r e n t M o d e l   =   # ( )  
                         c u r r e n t M o d e l   =   s e l e c t i o n   a s   a r r a y  
 	 	 	  
 	 	 	 c e n t e r M o d e l   =   g e t C e n t e r O f M o d e l   s e l e c t i o n  
 	 	 	  
                         m o d e l N a m e   =   g e t F i l e n a m e F i l e   f    
 	 	 	  
 	 	 	 p o i n t H e l p e r   =   p o i n t   n a m e :   " M o d e l C e n t e r "   p o s :   c e n t e r M o d e l  
 	 	 	  
 	 	 	 f o r   s s   i n   c u r r e n t M o d e l   d o   s s . p a r e n t   =   p o i n t H e l p e r  
 	 	 	  
 	 	 	 - - f o r c e U n g r o u p   s e l e c t i o n  
 	 	 	 a s s i g n A l l M a t e r i a l s   c u r r e n t M o d e l   m a t e r i a l s L i s t  
 	 	 	 f o r   c a m   i n   _ _ C A M E R A S   d o   (  
 	 	 	 	 f r a m e s   =   # ( )  
 	 	 	 	 v i e w s   =   g e t V e w C a m e r a P r o p   c a m  
 	 	 	 	  
 	 	 	 	 f o r   w w   i n   1   t o   p r e d e f i n e d F r a m e s . c o u n t   w h e r e   v i e w s [ w w ]   = =   t r u e   d o   a p p e n d   f r a m e s   p r e d e f i n e d F r a m e s [ w w ]  
 	 	 	 	  
 	 	 	 	 f o r   f r a m e   i n   f r a m e s   d o   ( 	 	 	 	  
 	 	 	 	 	 p o i n t H e l p e r . r o t a t i o n . z   =   0  
 	 	 	 	 	 r o t a t e   p o i n t H e l p e r   ( e u l e r A n g l e s   0   0   f r a m e [ 2 ] )  
 	 	 	 	 	 b a t c h R e n d e r   c u r r e n t M o d e l   p 2   m o d e l N a m e   f r a m e   c a m  
 	 	 	 	 )  
 	 	 	 )  
 	 	 	  
 	 	 	 f o r c e D e l e t e O b j e c t s   c u r r e n t M o d e l  
 	 	 	 d e l e t e   p o i n t H e l p e r  
 	 	 	  
                         p r o g r e s s U p d a t e   ( 1 0 0   *   i   /   f i l e s . c o u n t )  
 	 	 )  
 	 	  
 	 	 p r o g r e s s E n d ( )  
                  
 	 	 q   =   q u e r y B o x   " A l l   m o d e l s   a r e   r e n d e r e d . \ n \ n D o   y o u   w a n t   t o   o p e n   t h e   f o l d e r   w i t h   r e n d e r s ? "   t i t l e :   " C o n f i r m ! " 	 	 	  
 	 	 i f ( q )   d o   r e t u r n     s h e l l L a u n c h   p 2   " "  
 	 )  
 )  
  
 r o l l o u t   _ r A b o u t B R C   " A b o u t "   (  
         l a b e l   l b l N a m e   " "    
         l a b e l   l b l V e r   " "    
          
         l a b e l   l b l A u t h o r   " "   h e i g h t :   3 0  
         h y p e r l i n k   l b l C o p y   " "     a l i g n :   # c e n t e r  
          
         f n   g e t S c r i p t I n f o   s   r e l e a s e I n f o :   " "   =     (  
                 i f ( r e l e a s e I n f o   ! =   " " )   d o  
                 (  
                         r   =   g e t I N I S e t t i n g   s   r e l e a s e I n f o  
                         r e t u r n   r  
                 )  
  
                 v   =   g e t I N I S e t t i n g   s   " I N F O "   " V E R S I O N "  
                 a   =   g e t I N I S e t t i n g   s   " I N F O "   " A U T H O R "  
                 n   =   g e t I N I S e t t i n g   s   " I N F O "   " N A M E "  
                 o   =   g e t I N I S e t t i n g   s   " A B O U T "  
                 c   =   g e t I N I S e t t i n g   s   " I N F O "   " D E V "  
                 h   =   g e t I N I S e t t i n g   s   " I N F O "   " H E L P "  
                  
                 r   =   f o r   i   i n   ( g e t I N I S e t t i n g   s )   w h e r e   ( i   ! =   " A B O U T "   a n d   i   ! =   " S C R I P T "   a n d   i   ! =   " C O P Y " )   c o l l e c t   i  
                  
                 r e t u r n   # ( n ,   a ,   v ,   o ,   r ,   c ,   h )  
         )  
  
         o n   _ r A b o u t B R C   o p e n   d o   (  
                 i   =   g e t S c r i p t I n f o   ( g e t T h i s S c r i p t F i l e n a m e ( ) )  
                          
                 l b l N a m e . c a p t i o n   =   i [ 1 ]  
                 l b l A u t h o r . c a p t i o n   =   i [ 2 ]  
                 l b l V e r . c a p t i o n   =   i [ 3 ]  
                 l b l C o p y . a d d r e s s     =   l b l C o p y . c a p t i o n   =   i [ 6 ]  
         )  
 )  
  
 a d d R o l l o u t   _ r S t e p M a i n B R C   f B a t c h R e n d e r C h a i r s   r o l l e d U p : f a l s e  
 a d d R o l l o u t   _ r A b o u t B R C   f B a t c h R e n d e r C h a i r s   r o l l e d U p : t r u e   