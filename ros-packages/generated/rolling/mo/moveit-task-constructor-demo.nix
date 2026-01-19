{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  moveit-configs-utils,
  moveit-core,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning-interface,
  moveit-task-constructor-capabilities,
  moveit-task-constructor-core,
  moveit-task-constructor-visualization,
  py-binding-tools,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_demo";
  version = "0.1.4-2";
  src = finalAttrs.passthru.sources."moveit_task_constructor_demo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ generate-parameter-library moveit-configs-utils moveit-core moveit-resources-panda-moveit-config moveit-ros-planning-interface moveit-task-constructor-capabilities moveit-task-constructor-core moveit-task-constructor-visualization py-binding-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ generate-parameter-library moveit-configs-utils moveit-core moveit-resources-panda-moveit-config moveit-ros-planning-interface moveit-task-constructor-capabilities moveit-task-constructor-core moveit-task-constructor-visualization py-binding-tools ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_demo" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_demo-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "6e469b7ae708700818a4737f1ab51e457c13f73d";
        hash = "sha256-ypSbbkSRuKHybTvNrWcWVGy4710v1xma8p+ZIFSAdD0=";
      };
    };
  });
  meta = {
    description = "demo tasks illustrating various capabilities of MTC.";
  };
})
