# RU

## Общее назначение проекта

Цель данного проекта – создание единой платформы, которая обеспечивает централизованное управление антивирусными решениями на базе ClamAV в корпоративной среде. В отличие от классического сценария, где ClamAV устанавливается и обновляется вручную на каждом конечном устройстве, данная архитектура предоставляет возможность унифицированно распределять обновления антивирусных баз, проводить анализ подозрительных файлов, управлять политиками безопасности, а также контролировать состояние систем с центральной консоли.

## Основные компоненты и их функции

### Конечные узлы (клиентские машины)

- **PC Linux / PC Windows с Binucleus Antivirus Secure (ClamAV)**:  
  На конечных рабочих станциях, независимо от операционной системы, установлено решение Binucleus Antivirus Secure, использующее движок ClamAV для сканирования файлов и трафика.  
  Данный агент:
  - Регулярно получает обновления антивирусных баз
  - Проводит сканирование по расписанию или по запросу из центра
  - Отправляет результаты сканирования и статистику в центральный центр управления

### Централизованная инфраструктура управления

- **Binucleus CVD Update Server**:  
  Отвечает за получение и распространение актуальных антивирусных баз (CVD-файлов) для ClamAV. Он периодически обращается к официальным источникам обновлений ClamAV, загружает свежие сигнатуры и передаёт их внутрь корпоративной сети.

- **Binucleus BAS Distribute Server**:  
  Служит промежуточным звеном для распространение **Binucleus Antivirus Secure**. Обеспечивает масштабируемость решения при большом количестве клиентов.

- **Binucleus Antivirus Center**:  
  Главный центр координации всех процессов. Он:
  - Управляет расписанием сканирований и политиками безопасности
  - Собирает статистику об инцидентах и статусе антивирусной защиты
  - Предоставляет данные в консоль администратора

- **Binucleus Analysis Server**:  
  Предназначен для удалённого анализа подозрительных объектов, присылаемых с клиентских машин и возвращает результат в Antivirus Center.

- **СУБД (База данных)**:  
  Центральное хранилище для:
  - Конфигураций
  - Обновлений
  - Результатов сканирования
  - Инцидентов и журналов

### Интерфейс для сотрудников по безопасности

- **Binucleus Antivirus Console (консоль управления)**:  
  Предоставляет графический интерфейс для офицеров безопасности. Через консоль можно:
  - Запускать/останавливать сканирования
  - Настраивать расписания
  - Просматривать результаты анализа и отчёты о вредоносном ПО
  - Настраивать политики безопасности, исключения, реакции на обнаружения
  - Анализировать статистику и логи

## Логика взаимодействия компонентов

1. **Обновление баз сигнатур**:  
   - Binucleus CVD Update Server получает свежие базы от внешних репозиториев.

2. **Сканирование и анализ**:  
   - Конечные узлы выполняют сканирование по расписанию или по запросу.
   - Результаты сохраняются в базу данных и отображаются в консоли.

3. **Управление и мониторинг**:  
   - Офицер безопасности через консоль управляет политиками и мониторит состояние всех систем.
   - Все действия и события регистрируются в центральной базе данных.

## Преимущества подхода

- **Централизация управления**: Не нужно обновлять базы и настройки вручную на каждом ПК.
- **Масштабируемость**: Легкое добавление новых конечных устройств.
- **Глубокий анализ**: Подозрительные файлы можно анализировать более детально.
- **Простота эксплуатации**: Единая консоль снижает время реакции на инциденты.
- **Повышенная безопасность**: Централизованный мониторинг, логирование и аналитика.

## Итог

Данный проект представляет собой комплексное, масштабируемое и удобное решение для централизованного управления антивирусной защитой на базе ClamAV во всей корпоративной инфраструктуре. Он упрощает операционные процессы, снижает затраты на сопровождение, повышает общую безопасность и удобство работы службы информационной безопасности.

# EN

## General Purpose of the Project

The goal of this project is to create a unified platform that provides centralized management of ClamAV-based antivirus solutions within a corporate environment. Unlike the traditional scenario, where ClamAV is installed and updated manually on each endpoint device, this architecture enables the unified distribution of antivirus database updates, the analysis of suspicious files, the management of security policies, and system state monitoring from a central console.

## Main Components and Their Functions

### Endpoints (Client Machines)

- **PC Linux / PC Windows with Binucleus Antivirus Secure (ClamAV):**  
  On endpoint workstations, regardless of the operating system, Binucleus Antivirus Secure is installed, utilizing the ClamAV engine to scan files and traffic.  
  This agent:
  - Regularly receives antivirus database updates
  - Performs scheduled or on-demand scans initiated from the central system
  - Sends scan results and statistics to the central management center

### Centralized Management Infrastructure

- **Binucleus CVD Update Server:**  
  Responsible for retrieving and distributing the latest antivirus databases (CVD files) for ClamAV. It periodically contacts official ClamAV update sources, downloads fresh signatures, and then distributes them within the corporate network.

- **Binucleus BAS Distribute Server:**  
  Serves as an intermediary layer for distributing **Binucleus Antivirus Secure**. It ensures the solution can scale effectively for a large number of clients.

- **Binucleus Antivirus Center:**  
  The main coordination hub for all processes. It:
  - Manages scan schedules and security policies
  - Collects incident statistics and antivirus protection status
  - Provides data to the administrator console

- **Binucleus Analysis Server:**  
  Intended for the remote analysis of suspicious objects sent from client machines. It returns the results to the Antivirus Center.

- **DBMS (Database):**  
  The central repository for:
  - Configurations
  - Updates
  - Scan results
  - Incidents and logs

### Security Staff Interface

- **Binucleus Antivirus Console (Management Console):**  
  Provides a graphical interface for security officers. Through the console, they can:
  - Start/stop scans
  - Configure schedules
  - View analysis results and malware reports
  - Set up security policies, exceptions, and responses to detections
  - Analyze statistics and logs

## Component Interaction Logic

1. **Signature Database Updates:**  
   - The Binucleus CVD Update Server obtains the latest databases from external repositories.

2. **Scanning and Analysis:**  
   - Endpoints perform scans on a schedule or on demand.
   - Results are stored in the database and displayed in the console.

3. **Management and Monitoring:**  
   - Security officers use the console to manage policies and monitor the state of all systems.
   - All actions and events are recorded in the central database.

## Advantages of the Approach

- **Centralized Management:** No need to update databases and configurations manually on each PC.
- **Scalability:** Easy addition of new endpoints.
- **In-depth Analysis:** Suspicious files can be analyzed more thoroughly.
- **Ease of Operation:** A single console reduces response time to incidents.
- **Enhanced Security:** Centralized monitoring, logging, and analytics.

## Conclusion

This project represents a comprehensive, scalable, and convenient solution for centralized ClamAV-based antivirus management across the entire corporate infrastructure. It simplifies operational processes, reduces maintenance costs, and improves overall security and the efficiency of the information security team’s work.
