;------------------------------------------
;Definicao sobre o cliente	           |
;------------------------------------------
(deftemplate Cliente
	(slot come_carne)
	(slot tem_filho)
	(slot fumante)
	(slot muito_rico))

(deftemplate Restaurante
	(slot rest))


(deftemplate Endereco
	(slot ende))



;1

(defrule GetComeCarne
   =>
   (printout t "Voce come carne? (yes/no)" crlf)
   (bind ?resposta (read))
   (assert (Cliente (come_carne ?resposta))))

;2   
(defrule GetTemFilho
   =>
   (printout t "Voce tem filhos?(yes/no)")
   (bind ?resposta (read))
   (assert (Cliente (tem_filho ?resposta))))

;3   
(defrule GetFumante
   =>
   (printout t "Voce fuma?(yes/no)")
   (bind ?resposta (read))
   (assert (Cliente (fumante ?resposta))))

;4   
(defrule GetMuitoRico
   =>
   (printout t "Voce tem grana pra caramba?(yes/no)")
   (bind ?resposta (read))
   (assert (Cliente (muito_rico ?resposta))))


;  --------------------------------------------
;|   Regras pra escolher o restaurante    |
;  --------------------------------------------

;5
(defrule Carniceiro
	(and(Cliente (come_carne yes))
	(Cliente (fumante no))(Cliente (muito_rico no)))
	=>
	(assert(Restaurante(rest carniceiro )))
	(printout t "Voce deveria ir ao restaurante: O Carniceiro." crlf ))

;6
(defrule Churras
	(and (Cliente (come_carne yes))
	(Cliente(muito_rico yes))
	(Cliente(fumante no)))
	=>
	(assert(Restaurante(rest churras)))
	(printout t "Voce deveria ir ao restaurante: O Churras de Ouro." crlf ))
	
;7
(defrule AlfaceMagra
	(and (Cliente(come_carne no))(Cliente(muito_rico no)))
	=>
	(assert(Restaurante(rest alface_lisa)))
	(printout t "Voce deveria ir ao restaurante vegetariano: Alface Lisa." crlf))
	
;8
(defrule SojaKids
	(and(Cliente(come_carne no)) (Cliente(tem_filho yes)))
	=>
	(assert (Restaurante(rest soja_kids)))
	(printout t "Voce deveria ir ao restaurante vegetariano, que possui alternativas para as crianças: Soja Kids!" crlf))

;9	
(defrule Defumado
	(Cliente(fumante yes))
	=>
	(assert(Restaurante(rest defumado)))
	(printout t "Voce deveria ir ao restaurante: O Defumado, carnes, saladas e espaço para sopradores de fumaça!" crlf))

;10	
(defrule Cachimbo
	(and(Cliente(fumante yes))(Cliente(muito_rico yes))(Cliente(tem_filho no)))
	=>
	(assert(Restaurante(rest cachimbo)))
	(printout t "Voce deveria ir ao restaurante: Cachimbinho De Ouro, para quem gosta de comer e fumar bem!" crlf))

;11	
(defrule KidsMoke
	(and(Cliente(fumante yes))(Cliente(tem_filho yes))(Cliente(come_carne yes)))
	=>
	(assert(Restaurante(rest kidsmoke)))
	(printout t "Voce deveria ir ao restaurante: KidsMoke, desfrute carnes e fumos de qualidade com suas crianças!" crlf))
	
;19
(defrule Nobre
(and(Cliente(come_carne no))(Cliente(tem_filho no))(Cliente(fumante no))(Cliente(muito_rico yes)))
=>
(assert(Restaurante(rest nobre)))
(printout t "Voce deveria ir ao restaurante: Nobresnobe, o melhor lugar para vegetarianos ricos que odeiam crianças e cigarros!" crlf))

;21
(defrule Tigrao
(and(Cliente(come_carne yes))(Cliente(tem_filho yes))(Cliente(fumante yes))(Cliente(muito_rico yes)))
=>
(assert(Restaurante(rest tigrao)))
(printout t "Voce deveria ir ao restaurante: Tigrao Carnes! Comida cara, com espaço para crianças agitadas! Cinzeiros em todas as mesas" crlf))

;---------------------------------------
;Regras para o endereco
;---------------------------------------

;12
(defrule Alameda
	(Restaurante(rest carniceiro))
	=>
	(assert(Endereco(ende alameda01)))
	(printout t "Endereco: Alameda dos Anjos, 01" crlf crlf))

;13
(defrule Bento
	(Restaurante(rest churras))
	=>
	(assert(Endereco(ende bento123)))
	(printout t "Endereco: Av. Bento Gonçalves, 123" crlf crlf))

;14	
(defrule Fruta
	(Restaurante(rest alface_lisa))
	=>
	(assert(Endereco(ende fruta24)))
	(printout t "Endereco: Rua das Frutas, 24" crlf crlf))

;15	
(defrule Agriao
	(Restaurante(rest soja_kids))
	=>
	(assert(Endereco(ende agriao48)))
	(printout t "Endereco: Rua do Agriao, 48" crlf crlf))

;16
(defrule Tabaco
	(Restaurante(rest defumado))
	=>
	(assert(Endereco(ende tabaco171)))
	(printout t "Endereco: Av. Philip Morris, 171" crlf crlf)
)


;17
(defrule Tabaco2
	(Restaurante(rest cachimbo))
	=>
	(assert(Endereco(ende tabaco666)))
	(printout t "Endereco: Av. Philip Morris, 666" crlf crlf)
)

;18
(defrule Souza
	(Restaurante(rest kidsmoke))
	=>
	(assert(Endereco(ende souza2441)))
	(printout t "Endereco: Rua Souza Cruz, 2441, sala C" crlf crlf)
)

;20
(defrule Grana
(Restaurante(rest nobre))
=>
(assert(Endereco(ende grana101)))
(printout t "Endereco: Rua Bom de Grana, 101" crlf crlf))

;22
(defrule Deodoro
(Restaurante(rest tigrao))
=>
(assert(Endereco(ende deodo587)))
(printout t "Endereco: Rua Marechal Deodoro, 587" crlf crlf))


;------------------------------
;Preferencias do usuario atual
;------------------------------
;(deffacts Pref (Cliente (come_carne no) (tem_filho yes) (fumante yes) (muito_rico no)))





	