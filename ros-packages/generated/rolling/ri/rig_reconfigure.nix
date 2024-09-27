{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    imgui-vendor_source-f8704cd085c4347f835c21dc12a3951924143872 = substituteSource {
      src = fetchgit {
        name = "imgui-vendor_source-f8704cd085c4347f835c21dc12a3951924143872-source";
        url = "https://github.com/ocornut/imgui.git";
        rev = "f8704cd085c4347f835c21dc12a3951924143872";
        hash = "sha256-eY8lRsonPfDRTMCPhInT9rQ6lSaJPsXpkh428OKpTnA=";
      };
      substitutions = [
      ];
    };
    rig_reconfigure-4283814a77c44e9288104373831efbea6b955446 = substituteSource {
      src = fetchgit {
        name = "rig_reconfigure-4283814a77c44e9288104373831efbea6b955446-source";
        url = "https://github.com/ros2-gbp/rig_reconfigure-release.git";
        rev = "4283814a77c44e9288104373831efbea6b955446";
        hash = "sha256-5YdUtLc8CL42MhHlX2/Y0rbBFdE1G5GAIWBqj0NfIRY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ocornut/imgui.git";
          to = "URL ${imgui-vendor_source-f8704cd085c4347f835c21dc12a3951924143872}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "rig_reconfigure";
  version = "1.5.0-1";
  src = sources.rig_reconfigure-4283814a77c44e9288104373831efbea6b955446;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libglfw3-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Standalone GUI tool for editing node parameters at runtime.";
  };
}
