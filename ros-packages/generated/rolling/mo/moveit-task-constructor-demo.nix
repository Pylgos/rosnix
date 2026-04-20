{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
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
  version = "0.1.5-1";
  src = finalAttrs.passthru.sources."moveit_task_constructor_demo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager generate-parameter-library moveit-configs-utils moveit-core moveit-resources-panda-moveit-config moveit-ros-planning-interface moveit-task-constructor-capabilities moveit-task-constructor-core moveit-task-constructor-visualization py-binding-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager generate-parameter-library moveit-configs-utils moveit-core moveit-resources-panda-moveit-config moveit-ros-planning-interface moveit-task-constructor-capabilities moveit-task-constructor-core moveit-task-constructor-visualization py-binding-tools ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_demo" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_demo-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "ebb31c364cd9cc900304a6f8169e5c7ef946fb58";
        hash = "sha256-VjDXQg9Peq3ISZCwxI/zdkRnuRKjGmRKcUD3gyHrriQ=";
      };
    };
  });
  meta = {
    description = "demo tasks illustrating various capabilities of MTC.";
  };
})
