namespace APlanner.Models
{
    public class People
    {
        public int USerID { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public bool SOP { get; set; }
        public string Password { get; set; }
    }

    public class SPlan
    {
        public int PID { get; set; }
        public int SUserID { get; set; }
        public int TermID { get; set; }
        public float Probability { get; set; }
    }
}