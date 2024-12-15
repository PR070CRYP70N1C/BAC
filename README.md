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
  Служит промежуточным звеном для распределения обновлений, политик и конфигурационных данных между центральным репозиторием и конечными узлами. Обеспечивает масштабируемость решения при большом количестве клиентов.

- **Binucleus Antivirus Center**:  
  Главный центр координации всех процессов. Он:
  - Управляет расписанием сканирований и политиками безопасности
  - Собирает статистику об инцидентах и статусе антивирусной защиты
  - Взаимодействует с базой данных и Analysis Server для комплексного анализа угроз
  - Предоставляет данные в консоль администратора

- **Binucleus Analysis Server**:  
  Предназначен для углублённого анализа подозрительных объектов, присылаемых с клиентских машин. Может использовать дополнительные механизмы проверки (песочницы, эвристические анализаторы) и возвращать результаты в Antivirus Center.

- **СУБД (База данных)**:  
  Центральное хранилище для:
  - Конфигураций
  - Обновлений
  - Результатов сканирования
  - Инцидентов и журналов
  Доступ к базе данных имеют как Analysis Server, так и Antivirus Center, обеспечивая согласованность данных и аналитические возможности.

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
   - Binucleus BAS Distribute Server распространяет их конечным узлам.

2. **Сканирование и анализ**:  
   - Конечные узлы выполняют сканирование по расписанию или по запросу.
   - Обнаруженные угрозы или подозрительные файлы отправляются на Analysis Server.
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

The goal of this project is to create a unified platform that provides centralized management of antivirus solutions based on ClamAV in a corporate environment. Unlike the classic scenario where ClamAV is installed and updated manually on each endpoint, this architecture allows for the unified distribution of antivirus database updates, analysis of suspicious files, management of security policies, and monitoring of system status from a central console.

## Key Components and Their Functions

### Endpoints (Client Machines)

- **PC Linux / PC Windows with Binucleus Antivirus Secure (ClamAV)**:
On the end workstations, regardless of the operating system, the Binucleus Antivirus Secure solution is installed, utilizing the ClamAV engine for scanning files and traffic.
This agent:
- Regularly receives antivirus database updates
- Conducts scheduled or on-demand scans from the center
- Sends scan results and statistics to the central management center

### Centralized Management Infrastructure

- **Binucleus CVD Update Server**:  
  Responsible for receiving and distributing up-to-date antivirus databases (CVD files) for ClamAV. It periodically queries official ClamAV update sources, downloads fresh signatures, and transmits them within the corporate network.

- **Binucleus BAS Distribute Server**:  
  Serves as an intermediary for distributing updates, policies, and configuration data between the central repository and endpoint devices. It ensures the scalability of the solution with a large number of clients.

- **Binucleus Antivirus Center**:  
  The main coordination center for all processes. It:
  - Manages the scheduling of scans and security policies
  - Collects statistics on incidents and antivirus protection status
  - Interacts with the database and Analysis Server for comprehensive threat analysis
  - Provides data to the administrator console

- **Binucleus Analysis Server**:  
  Designed for in-depth analysis of suspicious objects sent from client machines. It can use additional verification mechanisms (sandboxes, heuristic analyzers) and return results to the Antivirus Center.

- **DBMS (Database)**:  
  A central repository for:
  - Configurations
  - Updates
  - Scan results
  - Incidents and logs
  Both the Analysis Server and Antivirus Center have access to the database, ensuring data consistency and analytical capabilities.

### Interface for Security Personnel

- **Binucleus Antivirus Console (management console)**:  
  Provides a graphical interface for security officers. Through the console, one can:
  - Start/stop scans
  - Configure schedules
  - View analysis results and reports on malware
  - Set security policies, exclusions, responses to detections
  - Analyze statistics and logs

## Logic of Component Interaction

1. **Signature Database Update**:  
   - Binucleus CVD Update Server receives fresh databases from external repositories.
   - Binucleus BAS Distribute Server distributes them to end nodes.

2. **Scanning and Analysis**:  
   - End nodes perform scans on schedule or on demand.
   - Detected threats or suspicious files are sent to the Analysis Server.
   - Results are saved in the database and displayed in the console.

3. **Management and Monitoring**:  
   - The security officer manages policies and monitors the status of all systems through the console.
   - All actions and events are logged in a central database.

## Advantages of the Approach

- **Centralized Management**: No need to update databases and settings manually on each PC.
- **Scalability**: Easy addition of new endpoints.
- **In-depth Analysis**: Suspicious files can be analyzed in more detail.
- **Ease of Operation**: A single console reduces incident response time.
- **Enhanced Security**: Centralized monitoring, logging, and analytics.

## Conclusion

This project represents a comprehensive, scalable, and user-friendly solution for centralized antivirus management based on ClamAV across the entire corporate infrastructure. It simplifies operational processes, reduces maintenance costs, enhances overall security, and improves the convenience of the information security service.
