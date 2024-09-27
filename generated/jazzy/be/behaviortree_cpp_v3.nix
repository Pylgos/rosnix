{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
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
    609281088cfefc76f9d0ce82e1ff6c30cc3591e5-vendor_source-1n4m7qzc1g0g5v0hpy6fgi71azwrxs97ca8na3bpzmikzyk7ij9z = substituteSource {
      src = fetchzip {
        name = "609281088cfefc76f9d0ce82e1ff6c30cc3591e5-vendor_source-1n4m7qzc1g0g5v0hpy6fgi71azwrxs97ca8na3bpzmikzyk7ij9z-source";
        url = "https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
        hash = "sha256-P8l4pv8z1n/XUBYpdpLumX8VTnzO+AvBLg+8wD4+ldg=";
      };
      substitutions = [
      ];
    };
    behaviortree_cpp_v3-0b5edf037bf08f1401392b7914a0d6add7789360 = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp_v3-0b5edf037bf08f1401392b7914a0d6add7789360-source";
        url = "https://github.com/ros2-gbp/behaviortree_cpp-release.git";
        rev = "0b5edf037bf08f1401392b7914a0d6add7789360";
        hash = "sha256-mNfg3QRd1f1UOvmGK4o+bj8+rt+2/pir2Z6H+vRmxDE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
          to = "URL ${609281088cfefc76f9d0ce82e1ff6c30cc3591e5-vendor_source-1n4m7qzc1g0g5v0hpy6fgi71azwrxs97ca8na3bpzmikzyk7ij9z}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "behaviortree_cpp_v3";
  version = "3.8.6-3";
  src = sources.behaviortree_cpp_v3-0b5edf037bf08f1401392b7914a0d6add7789360;
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
