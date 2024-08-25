{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  glfw3,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    rig_reconfigure = substituteSource {
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
          to = "URL ${rig_reconfigure-vendor_source-imgui-0}";
        }
      ];
    };
    rig_reconfigure-vendor_source-imgui-0 = substituteSource {
      src = fetchgit {
        name = "rig_reconfigure-vendor_source-imgui-0-source";
        url = "https://github.com/ocornut/imgui.git";
        rev = "f8704cd085c4347f835c21dc12a3951924143872";
        hash = "sha256-eY8lRsonPfDRTMCPhInT9rQ6lSaJPsXpkh428OKpTnA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rig_reconfigure";
  version = "1.5.0-1";
  src = sources.rig_reconfigure;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp glfw3 rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Standalone GUI tool for editing node parameters at runtime.";
  };
}
