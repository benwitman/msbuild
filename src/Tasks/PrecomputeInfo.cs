// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using System;
using Microsoft.Build.Framework;

#nullable disable

namespace Microsoft.Build.Tasks
{
    /// <summary>
    /// </summary>
    public sealed class PrecomputeInfo : TaskExtension, ITaskHybrid
    {
        /// <summary>
        /// </summary>
        [Output]
        public ITaskItem[] Inputs { get; set; }

        /// <summary>
        /// </summary>
        [Output]
        public ITaskItem[] Outputs { get; set; }


        public string[] DefaultInputProperties => new[] { "Inputs" };

        public string[] DefaultOutputProperties => new[] { "Outputs" };

        public bool ExecuteStatic()
        {
            return true;
        }

        public override bool Execute()
        {
            return true;
        }
    }
}
