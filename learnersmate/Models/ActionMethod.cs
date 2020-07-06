using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace learnersmate.Models
{
    [DataContract]
    public class ActionMethod
    {
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public List<Parameter> Parameters { get; set; }
        [DataMember]
        public string SupportedHttpMethods { get; set; }
    }
    [DataContract]
    public class Parameter
    {
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Source { get; set; } //where we pass the parameter when calling the action
        [DataMember]
        public string Type { get; set; }
        [DataMember]
        public List<Parameter> SubParameters { get; set; }

    }
}