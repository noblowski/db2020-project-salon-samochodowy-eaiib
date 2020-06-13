package app;
import java.sql.*;

public class Queries {
    private static Connection DatabaseConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost/salon?serverTimezone=UTC", "root", "root");
            System.out.println("connected");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

    private static ResultSet executeQuery(String query) throws SQLException {
        Connection connection = DatabaseConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultSet;
    }

    static void listClients() throws SQLException {
        ResultSet rs = executeQuery("select * from klienci");
        while (rs.next())
            System.out.println(rs.getInt(1) + " | " + rs.getString(2) + " | "
                    + rs.getString(3));
    }

    static void addBrand(String brandName) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "insert into salon.marki (nazwa) values (?)";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, brandName);
            int rowsInserted = statement.executeUpdate();
            if(rowsInserted > 0 ) System.out.println("Marka dodana!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void addClient(String firstName, String lastName) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "insert into salon.klienci (imie, nazwisko) values (?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            int rowsInserted = statement.executeUpdate();
            if(rowsInserted > 0 ) System.out.println("Klient dodany!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void delClient(int id) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "delete from salon.klienci where idKlienta = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, String.valueOf(id));
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) System.out.println("Klient usunięty!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void addOrder(int clientId, int carId, String orderDate, String paymentMethod) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "insert into salon.zamowienia(idKlienta, idSamochodu, data_zamowienia, metoda_platnosci) " +
                "values (?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, String.valueOf(clientId));
            statement.setString(2, String.valueOf(carId));
            statement.setString(3, orderDate);
            statement.setString(4, paymentMethod);
            int rowsInserted = statement.executeUpdate();
            if(rowsInserted > 0 ) System.out.println("Zamowienie dodane!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void addCar(int brandId, int modelId, int configId) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "insert into salon.samochody(idMarki, idModelu, idKonfiguracji) values (?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, String.valueOf(brandId));
            statement.setString(2, String.valueOf(modelId));
            statement.setString(3, String.valueOf(configId));
            int rowsInserted = statement.executeUpdate();
            if(rowsInserted > 0 ) System.out.println("Samochód dodany!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
