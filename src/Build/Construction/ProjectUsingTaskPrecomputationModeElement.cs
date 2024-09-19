// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using System;
using System.Diagnostics;

using Microsoft.Build.ObjectModelRemoting;
using Microsoft.Build.Shared;

#nullable disable

namespace Microsoft.Build.Construction
{
    /// <summary>
    /// </summary>
    [DebuggerDisplay("TaskName={TaskName} TaskMode={TaskMode}")]
    public class ProjectUsingTaskPrecomputationModeElement : ProjectElementContainer
    {
        /// <summary>
        /// External projects support
        /// </summary>
        internal ProjectUsingTaskPrecomputationModeElement(ProjectUsingTaskElementLink link)
            : base(link)
        {
        }

        /// <summary>
        /// </summary>
        internal ProjectUsingTaskPrecomputationModeElement(XmlElementWithLocation xmlElement, ProjectRootElement parent, ProjectRootElement containingProject)
            : base(xmlElement, parent, containingProject)
        {
            ErrorUtilities.VerifyThrowArgumentNull(parent, nameof(parent));
        }

        /// <summary>
        /// </summary>
        private ProjectUsingTaskPrecomputationModeElement(XmlElementWithLocation xmlElement, ProjectRootElement containingProject)
            : base(xmlElement, null, containingProject)
        {
        }

        /// <summary>
        /// Gets and sets the value of the TaskName attribute.
        /// </summary>
        public string TaskName
        {
            get => GetAttributeValue(XMakeAttributes.taskName);

            set
            {
                ErrorUtilities.VerifyThrowArgumentLength(value, XMakeAttributes.taskName);
                SetOrRemoveAttribute(XMakeAttributes.taskName, value, "Set usingtask TaskName {0}", value);
            }
        }

        /// <summary>
        /// Gets and sets the value of the TaskName attribute.
        /// </summary>
        public string TaskMode
        {
            get => GetAttributeValue(XMakeAttributes.taskMode);

            set
            {
                ErrorUtilities.VerifyThrowArgumentLength(value, XMakeAttributes.taskMode);
                SetOrRemoveAttribute(XMakeAttributes.taskMode, value, "Set usingtask TaskMode {0}", value);
            }
        }

        /// <summary>
        /// Location of the task name attribute
        /// </summary>
        public ElementLocation TaskNameLocation => GetAttributeLocation(XMakeAttributes.taskName);

        /// <summary>
        /// Location of the task mode attribute
        /// </summary>
        public ElementLocation TaskModeLocation => GetAttributeLocation(XMakeAttributes.taskMode);

        /// <summary>
        /// </summary>
        internal static ProjectUsingTaskPrecomputationModeElement CreateDisconnected(string taskName, string taskMode, ProjectRootElement containingProject)
        {
            ErrorUtilities.VerifyThrowArgument(
                String.IsNullOrEmpty(taskName),
                "PlaceHolderError",
                $"Mandtory");

            XmlElementWithLocation element = containingProject.CreateElement(XMakeElements.usingTaskPrecomputationMode);

            return new ProjectUsingTaskPrecomputationModeElement(element, containingProject)
            {
                TaskName = taskName,
                TaskMode = taskMode
            };
        }

        /// <summary>
        /// Overridden to verify that the potential parent and siblings
        /// are acceptable. Throws InvalidOperationException if they are not.
        /// </summary>
        internal override void VerifyThrowInvalidOperationAcceptableLocation(ProjectElementContainer parent, ProjectElement previousSibling, ProjectElement nextSibling)
        {
            ErrorUtilities.VerifyThrowInvalidOperation(parent is ProjectRootElement, "OM_CannotAcceptParent");
        }

        /// <inheritdoc />
        protected override ProjectElement CreateNewInstance(ProjectRootElement owner)
        {
            return owner.CreateUsingTaskPrecomputationModeElement(TaskName, TaskMode);
        }
    }
}
