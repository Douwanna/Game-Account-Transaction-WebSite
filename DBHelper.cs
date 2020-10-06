using System.Data;
using System.Data.Common;
using System.Configuration;
using System;
using System.Data.SqlClient;
namespace test
{
    class GameService
    {
        private int game_id;
        private int platform_id;
        private string service_name;
        public int Game_id
        {
            get{
                return game_id;
            }
            set{
                game_id = value;
            }
        }
        public int Pname
        {
            get { return platform_id; }
            set { platform_id = value; }
        }
        public string Ser_Name
        {
            get { return service_name; }
            set { service_name = value; }
        }
    }
    public class DbHelper
    {
        private static string dbProviderName = ConfigurationManager.ConnectionStrings["GMS"].ProviderName;
        private static string dbConnectionString = ConfigurationManager.ConnectionStrings["GMS"].ConnectionString;

        private SqlConnection connection;

        public void initSQLConnection()
        {
            string str = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = F:\\web程序设计\\test\\App_Data\\GMS.mdf; Integrated Security = True;";

            connection= new SqlConnection(str);
        }
        /// <summary>
        /// 插入或者修改sql
        /// 返回受影响的行
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>gt0：true;0：false</returns>
        public int insert_update(string sql)
        {
            this.initSQLConnection();
            connection.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sql,connection);
                int i = cmd.ExecuteNonQuery();
                return i;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return 0;
            }
            finally
            {
                connection.Close();
            }
        }
        /// <summary>
        /// 更新服务器表
        /// </summary>
        /// <param name="gid"></param>
        /// <param name="pid"></param>
        /// <param name="name"></param>
        /// <returns>1/0</returns>
        public int insert_to_(int gid,int pid,string name)
        {
            initSQLConnection();
            connection.Open();
            try
            {
                string sql = "insert into GameService(game_id,platform_id,service_name) values ("+gid+","+pid+",N'"+name+"')";
                SqlCommand cmd = new SqlCommand(sql, connection);
                int i= cmd.ExecuteNonQuery();
                return i;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return 0;
            }
            finally
            {
                connection.Close();
            }

        }
        /// <summary>
        /// 调用存储过程同步更新service表
        /// </summary>
        /// <param name="sql"></param>
        /// <returns>1/0</returns>
        public int add_game( string gname,int pid,string icon,string sname)
        {
            initSQLConnection();
            connection.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("add_Game",connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@gname", gname);
                cmd.Parameters.AddWithValue("@pid", pid);
                cmd.Parameters.AddWithValue("@icon", icon);
                cmd.Parameters.AddWithValue("@sname", sname);
                if (cmd.ExecuteNonQuery().ToString() == "1")
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return 0;
            }
            finally
            {
                connection.Close();
            }
        }
        public int show_sh_info(string sql,int id)
        {
            string update = "update SH set deal_process=N'" +sql+ "' where Id="+id;
            this.initSQLConnection();
            connection.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(update, connection);
                int i = cmd.ExecuteNonQuery();
                return i;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return 0;
            }
            finally
            {
                connection.Close();
            }
        }
        public string totalamount(string gid)
        {
            this.initSQLConnection();
            connection.Open();
            int id = Convert.ToInt32(gid);
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS cnt FROM Goods WHERE (game_id = "+id+")", connection);
                DbDataReader reader = cmd.ExecuteReader();
                while(reader.Read()){
                    return reader.GetValue(0).ToString();
                }
                reader.Close();
                return "0";
            }catch(Exception e)
            {
                Console.WriteLine(e.Message);
                return "0";
            }
            finally
            {
                connection.Close();
            }
        }
        public DataSet payds(string sql)
        {
            initSQLConnection();
            try
            {
                connection.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                da.SelectCommand = new SqlCommand(sql, connection);
                da.Fill(ds);
                return ds;
            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
                return null;
            }
            finally
            {
                connection.Close();
            }
        }
        /// <summary>
        /// 调用存储过程,实现购买
        /// </summary>
        /// <param name="sql"></param>
        /// <returns>ids</returns>
        public int buy_goods(int gid,int bid,int sid,decimal price)
        {
            initSQLConnection();
            connection.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("Buy_Goods", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@good_id", gid);
                cmd.Parameters.AddWithValue("@buyer_id", bid);
                cmd.Parameters.AddWithValue("@saler_id", sid);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.Add("@ids", SqlDbType.Decimal).Direction = ParameterDirection.Output;
                int cnt = cmd.ExecuteNonQuery();
                int ids=Convert.ToInt32(cmd.Parameters["@ids"].Value.ToString());
                return ids;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return 0;
            }
            finally
            {
                connection.Close();
            }
        }
        public string GetPwd(int good_id)
        {
            string sql = "select password from Goods where Id="+good_id;
            string pwd="";
            initSQLConnection();
            connection.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sql,connection);
                pwd = (string)cmd.ExecuteScalar();
            }catch(Exception e)
            {
                Console.WriteLine(e.Message);
                //return null;
            }
            finally
            {
                connection.Close();
            }
            return pwd;
        }
        public bool selectcmd(string sql)
        {
            initSQLConnection();
            connection.Open();
            string res = ""; 
            try
            {
                SqlCommand cmd = new SqlCommand(sql,connection);
                res = cmd.ExecuteScalar().ToString();
                
            }catch(Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                connection.Close();
            }
            if (res != "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
   
}