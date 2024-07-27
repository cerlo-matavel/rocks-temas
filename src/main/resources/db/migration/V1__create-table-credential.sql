CREATE TABLE course
(
    acronym VARCHAR(10) PRIMARY KEY,
    name    VARCHAR(511) NOT NULL
);

CREATE TABLE credential
(
    id       UUID DEFAULT RANDOM_UUID() PRIMARY KEY,
    username VARCHAR(511) UNIQUE NOT NULL,
    password VARCHAR(511) NOT NULL
);

CREATE TABLE student
(
    id             UUID DEFAULT RANDOM_UUID() PRIMARY KEY,
    student_number INT UNIQUE NOT NULL,
    name           VARCHAR(511) NOT NULL,
    email          VARCHAR(511) UNIQUE NOT NULL,
    course_id      VARCHAR(8)   NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course (acronym)
);


CREATE TABLE project
(
    id                  UUID DEFAULT RANDOM_UUID() PRIMARY KEY,
    theme               VARCHAR(511) UNIQUE NOT NULL,
    general_objective   VARCHAR(511) UNIQUE NOT NULL,
    specific_objectives VARCHAR(511) UNIQUE NOT NULL,
    problem             VARCHAR(511) UNIQUE NOT NULL,
    time_submitted      TIMESTAMP    NOT NULL,
    time_graded         TIMESTAMP,
    comment             VARCHAR(511),
    state               ENUM ('SUBMITTED', 'APPROVED', 'REJECTED'),
    student_id          UUID         NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE
);

INSERT INTO course (acronym, name)
VALUES ('LCA', 'Licenciatura em Contabilidade e Auditoria'),
       ('LEA', 'Licenciatura em Engenharia Ambiental'),
       ('LECT', 'Licenciatura em Engenharia Civil e de Transportes'),
       ('LECC', 'Licenciatura em Engenharia e Ciência dos Computadores'),
       ('LEMEC', 'Licenciatura em Engenharia Electromecânica'),
       ('LEET', 'Licenciatura em Engenharia Electrónica e de Telecomunicações'),
       ('LEE', 'Licenciatura em Engenharia Electrotécnica'),
       ('LEF', 'Licenciatura em Engenharia Ferroviária'),
       ('LEIT', 'Licenciatura em Engenharia Informática e de Telecomunicações'),
       ('LEMT', 'Licenciatura em Engenharia Mecânica e de Transportes'),
       ('LGBS', 'Licenciatura em Gestão Bancária e de Seguros'),
       ('LGF', 'Licenciatura em Gestão e Finanças');

INSERT INTO student (name, student_number, email, course_id)
VALUES ('João Silva', 1001, 'joao.silva@example.com', 'LECC'),
       ('Maria Costa', 1002, 'maria.costa@example.com', 'LCA'),
       ('Carlos Mendes', 1003, 'carlos.mendes@example.com', 'LEA'),
       ('Ana Rodrigues', 1004, 'ana.rodrigues@example.com', 'LECT'),
       ('Pedro Oliveira', 1005, 'pedro.oliveira@example.com', 'LEMEC'),
       ('Luisa Ferreira', 1006, 'luisa.ferreira@example.com', 'LEET'),
       ('Rui Santos', 1007, 'rui.santos@example.com', 'LEE'),
       ('Teresa Almeida', 1008, 'teresa.almeida@example.com', 'LEF'),
       ('Marta Sousa', 1009, 'marta.sousa@example.com', 'LEIT'),
       ('Nuno Gomes', 1010, 'nuno.gomes@example.com', 'LGBS'),
       ('Paulo Silva', 1011, 'paulo.silva@example.com', 'LECC'),
       ('Beatriz Martins', 1012, 'beatriz.martins@example.com', 'LCA'),
       ('Ricardo Pereira', 1013, 'ricardo.pereira@example.com', 'LEA'),
       ('Sofia Carvalho', 1014, 'sofia.carvalho@example.com', 'LECT'),
       ('Miguel Costa', 1015, 'miguel.costa@example.com', 'LEMEC'),
       ('Helena Neves', 1016, 'helena.neves@example.com', 'LEET'),
       ('Tiago Cruz', 1017, 'tiago.cruz@example.com', 'LEE'),
       ('Patrícia Lopes', 1018, 'patricia.lopes@example.com', 'LEF'),
       ('Inês Santos', 1019, 'ines.santos@example.com', 'LEIT'),
       ('Guilherme Ferreira', 1020, 'guilherme.ferreira@example.com', 'LGBS'),
       ('Mariana Oliveira', 1021, 'mariana.oliveira@example.com', 'LECC'),
       ('Filipe Costa', 1022, 'filipe.costa@example.com', 'LCA'),
       ('Daniela Nunes', 1023, 'daniela.nunes@example.com', 'LEA'),
       ('Alexandre Mendes', 1024, 'alexandre.mendes@example.com', 'LECT'),
       ('Carla Moreira', 1025, 'carla.moreira@example.com', 'LEMEC'),
       ('Rafael Sousa', 1026, 'rafael.sousa@example.com', 'LEET'),
       ('Joana Reis', 1027, 'joana.reis@example.com', 'LEE'),
       ('Henrique Matos', 1028, 'henrique.matos@example.com', 'LEF'),
       ('Catarina Antunes', 1029, 'catarina.antunes@example.com', 'LEIT'),
       ('Eduardo Cardoso', 1030, 'eduardo.cardoso@example.com', 'LGBS'),
       ('Aline Vieira', 1031, 'aline.vieira@example.com', 'LECC'),
       ('Lucas Silva', 1032, 'lucas.silva@example.com', 'LCA'),
       ('Fernanda Pinto', 1033, 'fernanda.pinto@example.com', 'LEA'),
       ('Hugo Rocha', 1034, 'hugo.rocha@example.com', 'LECT'),
       ('Vanessa Gomes', 1035, 'vanessa.gomes@example.com', 'LEMEC'),
       ('João Ramos', 1036, 'joao.ramos@example.com', 'LEET'),
       ('Clarice Lopes', 1037, 'clarice.lopes@example.com', 'LEE'),
       ('Bruno Martins', 1038, 'bruno.martins@example.com', 'LEF'),
       ('Sara Mendes', 1039, 'sara.mendes@example.com', 'LEIT'),
       ('Diego Almeida', 1040, 'diego.almeida@example.com', 'LGBS'),
       ('Vera Ribeiro', 1041, 'vera.ribeiro@example.com', 'LECC'),
       ('Marco Lima', 1042, 'marco.lima@example.com', 'LCA'),
       ('Natália Figueiredo', 1043, 'natalia.figueiredo@example.com', 'LEA'),
       ('Antônio Santos', 1044, 'antonio.santos@example.com', 'LECT'),
       ('Bruna Oliveira', 1045, 'bruna.oliveira@example.com', 'LEMEC'),
       ('Luís Correia', 1046, 'luis.correia@example.com', 'LEET'),
       ('Célia Castro', 1047, 'celia.castro@example.com', 'LEE'),
       ('Duarte Pires', 1048, 'duarte.pires@example.com', 'LEF'),
       ('Evelyn Campos', 1049, 'evelyn.campos@example.com', 'LEIT'),
       ('Gustavo Barbosa', 1050, 'gustavo.barbosa@example.com', 'LGBS');


INSERT INTO project (theme, general_objective, specific_objectives, problem, time_submitted, time_graded, comment, student_id, state)
VALUES
    (
        'Sistema de Irrigação Automatizado',
        'Desenvolver um sistema de irrigação automatizado utilizando sensores IoT para otimizar o uso de água na agricultura.',
        '1. Pesquisar tecnologias atuais de IoT para agricultura; 2. Projetar um mecanismo eficiente de distribuição de água; 3. Testar o sistema em diferentes culturas.',
        'A escassez de água é um problema significativo, e os agricultores precisam de soluções sustentáveis para otimizar o uso da água enquanto mantêm a produtividade das culturas.',
        '2024-07-26 10:15:30',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1001),
        'SUBMITTED'
    ),
    (
        'Gestão de Energia Residencial Inteligente',
        'Desenvolver um sistema que permita aos usuários gerenciar o consumo de energia doméstica através de um aplicativo móvel.',
        '1. Desenvolver uma interface intuitiva para monitoramento de energia; 2. Implementar alertas inteligentes para alto consumo de energia; 3. Integrar com dispositivos domésticos existentes.',
        'O aumento das contas de energia tem gerado a necessidade de soluções de gestão energética mais inteligentes para ajudar os consumidores a reduzir custos e o impacto ambiental.',
        '2024-07-26 11:00:45',
        '2024-07-28 09:25:00',
        'Aprovado após feedback inicial; implementar as alterações sugeridas.',
        (SELECT id FROM student WHERE student_number = 1002),
        'APPROVED'
    ),
    (
        'Gestão de Tráfego Baseada em IA',
        'Criar um sistema de gestão de tráfego baseado em IA para reduzir congestionamentos em áreas urbanas.',
        '1. Analisar padrões de tráfego usando aprendizado de máquina; 2. Desenvolver algoritmos preditivos para otimização do fluxo de tráfego; 3. Testar o sistema em um ambiente simulado.',
        'Áreas urbanas enfrentam congestionamento significativo, levando a um aumento da poluição e frustração dos passageiros. Uma solução baseada em IA pode ajudar a mitigar esses problemas.',
        '2024-07-25 14:45:10',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1003),
        'SUBMITTED'
    ),
    (
        'Aprimoramento de Plataforma de E-learning',
        'Melhorar uma plataforma de e-learning existente para aumentar o engajamento dos usuários e os resultados de aprendizagem.',
        '1. Implementar recursos de gamificação; 2. Adicionar caminhos de aprendizagem personalizados; 3. Incorporar IA para feedback personalizado.',
        'As plataformas de e-learning atuais carecem de recursos de engajamento, levando a taxas de conclusão mais baixas e satisfação do usuário.',
        '2024-07-26 13:22:50',
        '2024-07-29 15:30:00',
        'Rejeitado devido à falta de dados de pesquisa suficientes.',
        (SELECT id FROM student WHERE student_number = 1004),
        'REJECTED'
    ),
    (
        'Análise de Dados de Saúde',
        'Desenvolver um sistema para analisar dados de saúde em busca de insights preditivos e melhor atendimento ao paciente.',
        '1. Integrar múltiplas fontes de dados; 2. Implementar medidas de privacidade de dados; 3. Desenvolver modelos de aprendizado de máquina para previsões.',
        'Os provedores de saúde precisam de sistemas robustos para analisar efetivamente os dados dos pacientes para melhores resultados de tratamento e alocação de recursos.',
        '2024-07-27 09:30:00',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1005),
        'SUBMITTED'
    ),
    (
        'Entrega Autônoma por Drones',
        'Desenvolver um sistema de entrega por drones capaz de navegação autônoma e entrega em ambientes urbanos.',
        '1. Implementar navegação baseada em GPS; 2. Desenvolver sistemas de prevenção de colisões; 3. Testar a precisão da entrega em áreas urbanas.',
        'Com o aumento do e-commerce, sistemas de entrega eficientes são necessários para atender às demandas dos consumidores de forma rápida e confiável.',
        '2024-07-28 12:15:45',
        '2024-07-30 10:00:00',
        'Aprovado com recomendações de ajustes menores.',
        (SELECT id FROM student WHERE student_number = 1006),
        'APPROVED'
    ),
    (
        'Otimização de Energia Renovável',
        'Criar uma plataforma para otimizar a produção e distribuição de energia renovável com base na demanda.',
        '1. Desenvolver algoritmos para prever a demanda de energia; 2. Integrar com redes inteligentes; 3. Testar a escalabilidade da plataforma.',
        'As fontes de energia renovável são cruciais para o desenvolvimento sustentável, mas sua natureza intermitente requer sistemas inteligentes para utilização eficiente.',
        '2024-07-29 08:45:25',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1007),
        'SUBMITTED'
    ),
    (
        'Terapia de Realidade Virtual',
        'Explorar o uso de realidade virtual como ferramenta terapêutica para tratamento de saúde mental.',
        '1. Pesquisar a eficácia da VR na terapia; 2. Desenvolver um aplicativo de terapia VR protótipo; 3. Realizar testes com participantes.',
        'Os tratamentos de saúde mental podem se beneficiar de tecnologias imersivas como a VR, proporcionando novas maneiras de engajar e tratar os pacientes.',
        '2024-07-30 16:20:15',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1008),
        'SUBMITTED'
    ),
    (
        'Blockchain para Votação Segura',
        'Implementar um sistema de votação baseado em blockchain para aumentar a segurança e transparência nas eleições.',
        '1. Desenvolver uma estrutura segura de blockchain; 2. Garantir a privacidade e integridade dos dados; 3. Testar o sistema em um ambiente controlado.',
        'As eleições exigem sistemas transparentes e seguros para garantir confiança e participação, tornando o blockchain uma solução promissora.',
        '2024-07-31 10:50:00',
        '2024-08-02 11:30:00',
        'Projeto demonstrado com sucesso; aguardando aprovação final.',
        (SELECT id FROM student WHERE student_number = 1009),
        'APPROVED'
    ),
    (
        'Soluções de Agricultura Inteligente',
        'Projetar soluções de IoT para agricultura inteligente visando aumentar a produtividade e reduzir o desperdício.',
        '1. Implementar sensores de monitoramento do solo; 2. Desenvolver análises preditivas para gestão de culturas; 3. Integrar com sistemas de gestão de fazendas existentes.',
        'A agricultura enfrenta desafios como mudanças climáticas e gestão de recursos, necessitando de soluções inteligentes para melhorar a sustentabilidade.',
        '2024-08-01 14:05:20',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1010),
        'SUBMITTED'
    ),
    (
        'Sistema de Transporte Público Eficiente',
        'Desenvolver um sistema de transporte público que use dados em tempo real para melhorar a eficiência e reduzir os tempos de espera.',
        '1. Integrar dados de tráfego em tempo real; 2. Desenvolver algoritmos para otimização de rotas; 3. Testar o sistema em rotas urbanas.',
        'Os sistemas de transporte público frequentemente enfrentam atrasos e ineficiências que afetam a mobilidade urbana.',
        '2024-07-27 08:30:10',
        '2024-07-28 12:00:00',
        'Aprovado com ajustes necessários.',
        (SELECT id FROM student WHERE student_number = 1011),
        'APPROVED'
    ),
    (
        'Plataforma de Educação Inclusiva',
        'Criar uma plataforma de educação que acomode diferentes estilos de aprendizado e necessidades especiais.',
        '1. Desenvolver conteúdos personalizados; 2. Implementar tecnologias assistivas; 3. Testar a eficácia do aprendizado em diversos grupos.',
        'O acesso à educação de qualidade para todos ainda enfrenta barreiras significativas, especialmente para alunos com necessidades especiais.',
        '2024-07-26 09:45:30',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1012),
        'SUBMITTED'
    ),
    (
        'Aplicativo de Saúde e Bem-Estar',
        'Desenvolver um aplicativo móvel que auxilie os usuários a manter hábitos saudáveis e gerenciar o bem-estar mental.',
        '1. Implementar recursos de monitoramento de saúde; 2. Incluir técnicas de mindfulness; 3. Oferecer planos de exercício personalizados.',
        'Muitos indivíduos lutam para manter um estilo de vida saudável devido a rotinas ocupadas e falta de motivação.',
        '2024-07-26 15:20:15',
        '2024-07-29 14:10:00',
        'Rejeitado devido à falta de diferenciação de aplicativos existentes.',
        (SELECT id FROM student WHERE student_number = 1013),
        'REJECTED'
    ),
    (
        'Sistema de Alerta de Desastres Naturais',
        'Criar um sistema que use dados de sensores para fornecer alertas antecipados de desastres naturais.',
        '1. Integrar sensores ambientais; 2. Desenvolver algoritmos de previsão; 3. Testar o sistema em simulações de desastres.',
        'A falta de sistemas de alerta eficazes resulta em perda de vidas e danos materiais durante desastres naturais.',
        '2024-07-28 10:15:30',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1014),
        'SUBMITTED'
    ),
    (
        'Assistente Virtual para Idosos',
        'Desenvolver um assistente virtual que ajude idosos em suas atividades diárias e monitoramento de saúde.',
        '1. Integrar reconhecimento de voz; 2. Desenvolver lembretes automáticos; 3. Incluir monitoramento de saúde.',
        'Com o envelhecimento da população, há uma necessidade crescente de suporte tecnológico para melhorar a qualidade de vida dos idosos.',
        '2024-07-26 11:45:20',
        '2024-07-28 13:50:00',
        'Projeto aprovado com ajustes recomendados para usabilidade.',
        (SELECT id FROM student WHERE student_number = 1015),
        'APPROVED'
    ),
    (
        'Plataforma de Finanças Pessoais',
        'Criar uma plataforma que auxilie os usuários a gerenciar suas finanças pessoais e planejar orçamentos.',
        '1. Desenvolver ferramentas de orçamento; 2. Implementar alertas de gastos; 3. Incluir educação financeira.',
        'Muitos indivíduos não têm conhecimento adequado para gerenciar suas finanças, resultando em problemas de endividamento e falta de planejamento.',
        '2024-07-28 09:20:00',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1016),
        'SUBMITTED'
    ),
    (
        'Sistema de Monitoramento de Qualidade do Ar',
        'Desenvolver um sistema para monitorar a qualidade do ar em tempo real e fornecer dados para políticas ambientais.',
        '1. Integrar sensores de poluentes; 2. Desenvolver uma interface de visualização de dados; 3. Analisar tendências de qualidade do ar.',
        'A poluição do ar é um problema crescente que afeta a saúde pública e requer monitoramento contínuo para mitigar seus efeitos.',
        '2024-07-29 13:35:45',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1017),
        'SUBMITTED'
    ),
    (
        'Ferramenta de Colaboração Remota',
        'Desenvolver uma ferramenta que melhore a colaboração remota em equipes, integrando comunicação e gestão de projetos.',
        '1. Implementar funcionalidades de videoconferência; 2. Integrar com ferramentas de gestão de projetos; 3. Oferecer espaços de trabalho colaborativo.',
        'Com o aumento do trabalho remoto, há uma necessidade crescente de ferramentas que facilitem a colaboração e a comunicação entre equipes.',
        '2024-07-30 11:50:30',
        '2024-08-01 15:25:00',
        'Aprovado com feedback positivo sobre integração de funcionalidades.',
        (SELECT id FROM student WHERE student_number = 1018),
        'APPROVED'
    ),
    (
        'Sistema de Gestão de Resíduos',
        'Criar um sistema que otimize a coleta e reciclagem de resíduos em áreas urbanas.',
        '1. Desenvolver algoritmos para otimização de rotas de coleta; 2. Integrar com dados de resíduos em tempo real; 3. Implementar soluções de reciclagem automatizada.',
        'A gestão ineficiente de resíduos em áreas urbanas leva a problemas ambientais e de saúde pública, exigindo soluções inovadoras.',
        '2024-07-29 14:10:20',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1019),
        'SUBMITTED'
    ),
    (
        'Plataforma de Treinamento em Realidade Aumentada',
        'Desenvolver uma plataforma de treinamento que use realidade aumentada para melhorar a experiência de aprendizagem.',
        '1. Criar conteúdos interativos de RA; 2. Integrar com dispositivos de RA; 3. Avaliar a eficácia do treinamento em diferentes setores.',
        'O treinamento tradicional muitas vezes não engaja adequadamente os alunos, necessitando de métodos inovadores para melhorar a retenção de conhecimento.',
        '2024-07-27 10:45:30',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1020),
        'SUBMITTED'
    ),
    (
        'Sistema de Segurança Residencial Inteligente',
        'Criar um sistema de segurança residencial que use IA para detectar atividades suspeitas e alertar os proprietários.',
        '1. Integrar câmeras de vigilância inteligentes; 2. Desenvolver algoritmos de detecção de intrusões; 3. Implementar notificações automáticas.',
        'A segurança residencial é uma preocupação crescente, e muitos sistemas existentes não oferecem soluções proativas contra ameaças.',
        '2024-07-30 09:20:00',
        '2024-08-01 11:50:00',
        'Aprovado após ajustes de funcionalidades de segurança.',
        (SELECT id FROM student WHERE student_number = 1021),
        'APPROVED'
    ),
    (
        'Aplicativo de Reciclagem Inteligente',
        'Desenvolver um aplicativo que incentive os usuários a reciclar corretamente e acompanhar seu impacto ambiental.',
        '1. Criar um sistema de recompensas para reciclagem; 2. Incluir informações sobre materiais recicláveis; 3. Fornecer relatórios de impacto ambiental.',
        'A falta de conscientização e motivação para reciclar resulta em baixa taxa de reciclagem e aumento de resíduos em aterros sanitários.',
        '2024-07-28 08:30:10',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1022),
        'SUBMITTED'
    ),
    (
        'Sistema de Gestão de Inventário Automatizado',
        'Desenvolver um sistema que use IoT para automatizar a gestão de inventário em armazéns.',
        '1. Integrar sensores de inventário; 2. Desenvolver uma interface de monitoramento em tempo real; 3. Implementar algoritmos de previsão de estoque.',
        'A gestão de inventário manual é propensa a erros e ineficiências, resultando em perdas financeiras e operacionais.',
        '2024-07-29 12:10:45',
        '2024-07-31 16:30:00',
        'Rejeitado devido à falta de integração com sistemas existentes.',
        (SELECT id FROM student WHERE student_number = 1023),
        'REJECTED'
    ),
    (
        'Plataforma de Economia Compartilhada',
        'Criar uma plataforma que permita aos usuários compartilhar recursos e serviços em suas comunidades.',
        '1. Desenvolver uma interface de usuário intuitiva; 2. Implementar sistemas de pagamento seguros; 3. Incluir funcionalidades de avaliação de usuários.',
        'A economia compartilhada está em crescimento, mas muitas plataformas existentes não atendem às necessidades locais e de comunidades específicas.',
        '2024-07-30 10:40:20',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1024),
        'SUBMITTED'
    ),
    (
        'Sistema de Monitoramento de Animais Selvagens',
        'Desenvolver um sistema que use drones para monitorar populações de animais selvagens e preservar a biodiversidade.',
        '1. Integrar câmeras de alta resolução; 2. Desenvolver algoritmos de análise de imagens; 3. Testar o sistema em diferentes habitats.',
        'A perda de biodiversidade é uma preocupação global, e o monitoramento eficaz de populações de animais selvagens é crucial para a conservação.',
        '2024-07-28 14:15:30',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1025),
        'SUBMITTED'
    ),
    (
        'Assistente Virtual para Educação Financeira',
        'Desenvolver um assistente virtual que auxilie os usuários a melhorar seus conhecimentos financeiros e tomar decisões informadas.',
        '1. Implementar conteúdos de educação financeira; 2. Incluir simulações de investimentos; 3. Oferecer dicas personalizadas de finanças.',
        'A educação financeira é frequentemente negligenciada, levando a decisões financeiras mal informadas e problemas de endividamento.',
        '2024-07-26 15:10:10',
        '2024-07-29 13:40:00',
        'Aprovado com ajustes para personalização de conteúdo.',
        (SELECT id FROM student WHERE student_number = 1026),
        'APPROVED'
    ),
    (
        'Plataforma de Treinamento de Habilidades Digitais',
        'Criar uma plataforma que ofereça treinamento em habilidades digitais para melhorar a empregabilidade dos usuários.',
        '1. Desenvolver módulos de aprendizagem interativos; 2. Incluir certificações de habilidades; 3. Oferecer caminhos de aprendizado personalizados.',
        'O rápido avanço da tecnologia criou uma lacuna de habilidades digitais, limitando as oportunidades de emprego para muitas pessoas.',
        '2024-07-27 09:50:20',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1027),
        'SUBMITTED'
    ),
    (
        'Sistema de Gestão de Eventos Automatizado',
        'Desenvolver um sistema que automatize a gestão de eventos, incluindo planejamento, execução e análise de dados.',
        '1. Criar ferramentas de planejamento colaborativo; 2. Integrar com plataformas de análise de dados; 3. Implementar notificações automáticas.',
        'A gestão de eventos frequentemente enfrenta desafios de coordenação e comunicação, resultando em experiências insatisfatórias para os participantes.',
        '2024-07-29 11:20:00',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1028),
        'SUBMITTED'
    ),
    (
        'Aplicativo de Nutrição Personalizada',
        'Criar um aplicativo que ofereça planos de nutrição personalizados com base em dados de saúde e preferências alimentares.',
        '1. Desenvolver um algoritmo de recomendação de dietas; 2. Incluir um diário alimentar; 3. Oferecer integração com dispositivos de saúde.',
        'A nutrição personalizada é uma área emergente que pode ajudar as pessoas a atingirem seus objetivos de saúde de maneira eficaz.',
        '2024-07-28 13:10:20',
        '2024-07-30 17:00:00',
        'Rejeitado devido a problemas de precisão no algoritmo de recomendação.',
        (SELECT id FROM student WHERE student_number = 1029),
        'REJECTED'
    ),
    (
        'Sistema de Gestão de Energia Solar',
        'Desenvolver um sistema que otimize a produção e armazenamento de energia solar em ambientes residenciais.',
        '1. Integrar com painéis solares; 2. Desenvolver algoritmos de otimização de energia; 3. Testar o sistema em diferentes condições climáticas.',
        'O aumento do uso de energia solar requer soluções inteligentes para maximizar a eficiência e o armazenamento de energia.',
        '2024-07-27 10:15:00',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1030),
        'SUBMITTED'
    ),
    (
        'Plataforma de Cuidados de Saúde Remotos',
        'Criar uma plataforma que facilite o acesso a cuidados de saúde remotos, integrando telemedicina e monitoramento de saúde.',
        '1. Desenvolver funcionalidades de consulta remota; 2. Integrar com dispositivos de monitoramento de saúde; 3. Garantir a privacidade e segurança dos dados dos pacientes.',
        'O acesso a cuidados de saúde é um desafio em muitas áreas, e a telemedicina oferece uma solução promissora para melhorar a acessibilidade.',
        '2024-07-30 11:15:45',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1031),
        'SUBMITTED'
    ),
    (
        'Aplicativo de Mobilidade Urbana Sustentável',
        'Desenvolver um aplicativo que incentive a mobilidade urbana sustentável através de informações sobre transportes públicos e caronas.',
        '1. Incluir dados em tempo real de transporte público; 2. Implementar sistemas de caronas seguras; 3. Oferecer recompensas por práticas sustentáveis.',
        'As cidades enfrentam problemas de congestionamento e poluição, exigindo soluções que incentivem práticas de mobilidade sustentável.',
        '2024-07-28 14:50:30',
        '2024-07-31 10:00:00',
        'Aprovado com sugestões de integração com mais sistemas de transporte.',
        (SELECT id FROM student WHERE student_number = 1032),
        'APPROVED'
    ),
    (
        'Plataforma de Aprendizado de Máquina para Negócios',
        'Criar uma plataforma que permita às empresas implementar soluções de aprendizado de máquina de maneira acessível e eficaz.',
        '1. Desenvolver ferramentas de análise preditiva; 2. Incluir modelos de aprendizado de máquina prontos para uso; 3. Oferecer integração com dados empresariais existentes.',
        'Muitas empresas reconhecem o potencial do aprendizado de máquina, mas enfrentam desafios para implementá-lo de forma eficaz devido à complexidade técnica.',
        '2024-07-27 09:40:00',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1033),
        'SUBMITTED'
    ),
    (
        'Sistema de Gestão de Doenças Crônicas',
        'Desenvolver um sistema que auxilie pacientes a gerenciar suas doenças crônicas através de monitoramento e suporte contínuos.',
        '1. Integrar com dispositivos de monitoramento de saúde; 2. Oferecer lembretes de medicamentos; 3. Prover suporte e orientação personalizados.',
        'Pacientes com doenças crônicas frequentemente enfrentam dificuldades em gerenciar suas condições de saúde de forma eficaz e consistente.',
        '2024-07-28 08:45:20',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1034),
        'SUBMITTED'
    ),
    (
        'Plataforma de E-commerce Sustentável',
        'Criar uma plataforma de e-commerce que promova produtos sustentáveis e práticas de compra conscientes.',
        '1. Incluir uma seção de produtos certificados como sustentáveis; 2. Oferecer informações sobre impacto ambiental dos produtos; 3. Implementar sistemas de reciclagem para embalagens.',
        'O consumo consciente está em crescimento, mas os consumidores frequentemente não têm acesso a informações suficientes para fazer escolhas informadas.',
        '2024-07-29 11:30:15',
        '2024-07-31 14:00:00',
        'Rejeitado devido à falta de parceiros sustentáveis.',
        (SELECT id FROM student WHERE student_number = 1035),
        'REJECTED'
    ),
    (
        'Sistema de Análise de Sentimentos em Mídias Sociais',
        'Desenvolver um sistema que analise sentimentos em mídias sociais para auxiliar empresas a entender melhor o público.',
        '1. Integrar APIs de redes sociais; 2. Desenvolver algoritmos de análise de sentimentos; 3. Testar a precisão da análise em diferentes plataformas.',
        'Com o aumento do uso de mídias sociais, empresas precisam de ferramentas para entender a percepção pública e responder a tempo.',
        '2024-07-28 15:10:30',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1036),
        'SUBMITTED'
    ),
    (
        'Sistema de Gestão de Recursos Naturais',
        'Criar um sistema que ajude a gerenciar e conservar recursos naturais através de dados e análises.',
        '1. Desenvolver uma interface de monitoramento de recursos; 2. Implementar análises preditivas de uso de recursos; 3. Oferecer soluções de conservação.',
        'A conservação de recursos naturais é um desafio crítico, exigindo ferramentas que ajudem na gestão e uso sustentável desses recursos.',
        '2024-07-27 10:25:00',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1037),
        'SUBMITTED'
    ),
    (
        'Aplicativo de Exercícios para Saúde Mental',
        'Desenvolver um aplicativo que combine exercícios físicos com práticas de mindfulness para melhorar a saúde mental dos usuários.',
        '1. Criar programas de exercícios personalizados; 2. Incluir sessões de meditação guiada; 3. Integrar com dispositivos de monitoramento de saúde.',
        'A saúde mental é uma preocupação crescente, e a integração de atividades físicas e mindfulness pode oferecer benefícios significativos.',
        '2024-07-30 09:50:00',
        '2024-08-01 12:20:00',
        'Aprovado com recomendações de testes em grupos diversificados.',
        (SELECT id FROM student WHERE student_number = 1038),
        'APPROVED'
    ),
    (
        'Plataforma de Conexão de Voluntários',
        'Criar uma plataforma que conecte voluntários a oportunidades de serviço comunitário com base em suas habilidades e interesses.',
        '1. Desenvolver um sistema de correspondência de habilidades; 2. Incluir funcionalidades de feedback e avaliação; 3. Oferecer suporte para projetos comunitários.',
        'O voluntariado é uma forma eficaz de impactar positivamente as comunidades, mas muitos indivíduos enfrentam dificuldades para encontrar oportunidades adequadas.',
        '2024-07-28 12:45:30',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1039),
        'SUBMITTED'
    ),
    (
        'Sistema de Otimização de Logística',
        'Desenvolver um sistema que use IA para otimizar operações logísticas e reduzir custos de transporte.',
        '1. Integrar dados de tráfego em tempo real; 2. Desenvolver algoritmos de otimização de rotas; 3. Testar o sistema em operações logísticas reais.',
        'A logística é uma área crítica para muitas indústrias, e a otimização de operações pode resultar em economias significativas e melhor eficiência.',
        '2024-07-27 09:35:00',
        NULL,
        NULL,
        (SELECT id FROM student WHERE student_number = 1040),
        'SUBMITTED'
    );

