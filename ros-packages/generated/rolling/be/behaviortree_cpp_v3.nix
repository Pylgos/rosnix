{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "behaviortree_cpp_v3" = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp_v3-source";
        url = "https://github.com/ros2-gbp/behaviortree_cpp-release.git";
        rev = "f18a7c1b9d17c301c5f8493e8074eeefee4fd821";
        hash = "sha256-mNfg3QRd1f1UOvmGK4o+bj8+rt+2/pir2Z6H+vRmxDE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
          to = "URL ${sources."behaviortree_cpp_v3/609281088cfefc76f9d0ce82e1ff6c30cc3591e5"}";
        }
      ];
    };
    "behaviortree_cpp_v3/609281088cfefc76f9d0ce82e1ff6c30cc3591e5" = substituteSource {
      src = fetchzip {
        name = "609281088cfefc76f9d0ce82e1ff6c30cc3591e5-source";
        url = "https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
        hash = "sha256-P8l4pv8z1n/XUBYpdpLumX8VTnzO+AvBLg+8wD4+ldg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "behaviortree_cpp_v3";
  version = "3.8.6-2";
  src = sources."behaviortree_cpp_v3";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libncurses-dev" "libzmq3-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides the Behavior Trees core library.";
  };
}
