{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    behaviortree_cpp_v3 = substituteSource {
      src = fetchFromGitHub {
        name = "behaviortree_cpp_v3-source";
        owner = "ros2-gbp";
        repo = "behaviortree_cpp-release";
        rev = "0b5edf037bf08f1401392b7914a0d6add7789360";
        hash = "sha256-mNfg3QRd1f1UOvmGK4o+bj8+rt+2/pir2Z6H+vRmxDE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
          to = "URL ${behaviortree_cpp_v3-vendor_source-609281088cfefc76f9d0ce82e1ff6c30cc3591e5-0}";
        }
      ];
    };
    behaviortree_cpp_v3-vendor_source-609281088cfefc76f9d0ce82e1ff6c30cc3591e5-0 = substituteSource {
      src = fetchzip {
        name = "behaviortree_cpp_v3-vendor_source-609281088cfefc76f9d0ce82e1ff6c30cc3591e5-0-source";
        url = "https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
        hash = "sha256-P8l4pv8z1n/XUBYpdpLumX8VTnzO+AvBLg+8wD4+ldg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "behaviortree_cpp_v3";
  version = "3.8.6-3";
  src = sources.behaviortree_cpp_v3;
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
