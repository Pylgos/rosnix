{
  ament-cmake,
  ament-index-cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rig_reconfigure" = substituteSource {
      src = fetchgit {
        name = "rig_reconfigure-source";
        url = "https://github.com/ros2-gbp/rig_reconfigure-release.git";
        rev = "59ad0f7a3677a7c7a1c8c52ecf7ac06730528198";
        hash = "sha256-5YdUtLc8CL42MhHlX2/Y0rbBFdE1G5GAIWBqj0NfIRY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ocornut/imgui.git";
          to = "URL ${sources."rig_reconfigure/imgui"}";
        }
      ];
    };
    "rig_reconfigure/imgui" = substituteSource {
      src = fetchgit {
        name = "imgui-source";
        url = "https://github.com/ocornut/imgui.git";
        rev = "f8704cd085c4347f835c21dc12a3951924143872";
        hash = "sha256-eY8lRsonPfDRTMCPhInT9rQ6lSaJPsXpkh428OKpTnA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rig_reconfigure";
  version = "1.5.0-1";
  src = sources."rig_reconfigure";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libglfw3-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Standalone GUI tool for editing node parameters at runtime.";
  };
}
