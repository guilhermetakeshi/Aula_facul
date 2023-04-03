/******************************************************************************


BANCO DE DADOS

- Precisamos dos modelos de dados para descrever com mais detalhes a estrutura de um
BD
- Esses modelos serão usados peloe desenvolvedores e como documentação de proj.


-- Modelo Conceitual:
    - Técnicas para construir modelos conceituais (peter chen) MER e DER
    - DER: Diagrama Entidade Relacionamento
    - MER: Modelo Entidade Relacionamento
    
    - Entidade:
        - São os principais objetos de dados sobre quais indfo devem ser coletadas.
        
    - Atributo:
        - São características de entidades que oferecem detalhes sobre elas.
        - Tipo de atributo:
            - Simples: São chamados de atômicos. Não podem ser divididos.
            Exemplos: nome, peso.
            - Compostos: para definir uma informação da entidade, são usados vários 
            atributos. Por exemplo, o endereço pode ser composto por rua, número, bairro, etc.
            - Multivalorado: São aqueles que possuem um ou mais valores p/ o msm atributo.
            
            
    - Relacionamento:
        - Representam associações do mundo real entre uma ou mais entidades.
        
        - Relacionamento 1..1 (um para um): cada uma das duas entidades envolvidas 
        referenciam obrigatoriamente apenas uma unidade da outra. 
        
        - Relacionamento 1..n ou 1..* (um para muitos): uma das entidades envolvidas pode 
        referenciar várias unidades da outra, porém, do outro lado cada uma das várias unidades 
        referenciadas só pode estar ligada uma unidade da outra entidade.
        
        - Relacionamento n..n ou *..* (muitos para muitos): neste tipo de relacionamento cada 
        entidade, de ambos os lados, podem referenciar múltiplas unidades da outra.
            \-> Neste relacionamento, o relacionamentodas tabelas, obrigatoriamente vai ser uma tabela.
    
    - Chave primaria: é um campo da tabela ou atributo na qual definimos para identificar cada 
    registro é um valor que n pode se repetir.
    
    - Chave Candidata: São campos ou atributos com potencial para ser chave primaria.
    
    - Chave Estrangeira: São campos ou atributos que estabelecem o RELACIONAMENTO com outra tabela
    através da chave primária.
    
    - CHave Composta: Constituida de 2 ou mais atributos. Quando não há como um campo possuir 
    valores únicos. Neste caso, combina-se dois campos.

    - Restrição de Integridade:
        - Referencial: Assegura que os valores inseridos em uma tabela são baseados em valores que
        estão presentes em outra tabela. (quando vc entra com um dado, e ele n exite nas tabelas primarias)
        
        - Restrição de Domínio
    - O valor de cada atributo deve ser um valor atômico
    - Restrição de chaves e valores nulos
    - Duas tuplas distintas não podem ter valores idênticos para todos os
    atributos da chave
    - Chave Primária=atributo-chave, Chaves candidatas
    - Se um atributo tiver que ter um valor ele será definido como NOT NULL
    - Restrição de Integridade de Entidade
    - Nenhum valor de chave primária pode ser NULL

*******************************************************************************/


