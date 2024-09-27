{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rmw_implementation,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    performance_test-bb8375cdd83c85fd78c27dbb34f7c75ee5444628 = substituteSource {
      src = fetchgit {
        name = "performance_test-bb8375cdd83c85fd78c27dbb34f7c75ee5444628-source";
        url = "https://github.com/ros2-gbp/performance_test-release.git";
        rev = "bb8375cdd83c85fd78c27dbb34f7c75ee5444628";
        hash = "sha256-xnTxHvplWaFior1NZmiF+oFRCJ2cvWwKWUY55BnS4ns=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/Tencent/rapidjson.git";
          to = "URL ${rapidjson-vendor_source-f54b0e47a08782a6131cc3d60f94d038fa6e0a51}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/mirror/tclap.git";
          to = "URL ${tclap-vendor_source-799a8b1f99818e39fee19d0601030770af1221e1}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/p-ranav/tabulate.git";
          to = "URL ${tabulate-vendor_source-57b1032aff2d8b115a56d20c2584170bae0ff852}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/r-lyeh-archived/sole.git";
          to = "URL ${sole-vendor_source-e4678426147adb9d4f9f978c9560a7d0343b8c32}";
        }
      ];
    };
    rapidjson-vendor_source-f54b0e47a08782a6131cc3d60f94d038fa6e0a51 = substituteSource {
      src = fetchgit {
        name = "rapidjson-vendor_source-f54b0e47a08782a6131cc3d60f94d038fa6e0a51-source";
        url = "https://github.com/Tencent/rapidjson.git";
        rev = "f54b0e47a08782a6131cc3d60f94d038fa6e0a51";
        hash = "sha256-mFM1Etpf+qF/G0t91eXD8FQXwSQKyQbJq8gUA0jsm4Q=";
      };
      substitutions = [
      ];
    };
    sole-vendor_source-e4678426147adb9d4f9f978c9560a7d0343b8c32 = substituteSource {
      src = fetchgit {
        name = "sole-vendor_source-e4678426147adb9d4f9f978c9560a7d0343b8c32-source";
        url = "https://github.com/r-lyeh-archived/sole.git";
        rev = "e4678426147adb9d4f9f978c9560a7d0343b8c32";
        hash = "sha256-HxTUT2NFLkg4MDqN8iIUr/22gXiWV0CKSi1TD0nSazc=";
      };
      substitutions = [
      ];
    };
    tabulate-vendor_source-57b1032aff2d8b115a56d20c2584170bae0ff852 = substituteSource {
      src = fetchgit {
        name = "tabulate-vendor_source-57b1032aff2d8b115a56d20c2584170bae0ff852-source";
        url = "https://github.com/p-ranav/tabulate.git";
        rev = "57b1032aff2d8b115a56d20c2584170bae0ff852";
        hash = "sha256-yI6KLWjquuxnqXPe9Q4rPTwQv+FBr/EtPJx3fOqg63M=";
      };
      substitutions = [
      ];
    };
    tclap-vendor_source-799a8b1f99818e39fee19d0601030770af1221e1 = substituteSource {
      src = fetchgit {
        name = "tclap-vendor_source-799a8b1f99818e39fee19d0601030770af1221e1-source";
        url = "https://github.com/mirror/tclap.git";
        rev = "799a8b1f99818e39fee19d0601030770af1221e1";
        hash = "sha256-kdrzAj5C/9AmA8OGntgmq4bAadAFzu6nz2brAddLNIk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "performance_test";
  version = "2.3.0-1";
  src = sources.performance_test-bb8375cdd83c85fd78c27dbb34f7c75ee5444628;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rmw_implementation rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tool to test performance of ROS2 and DDS data layers and communication.";
  };
}
