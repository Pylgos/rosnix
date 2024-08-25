{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  rclcpp,
  rmw_implementation,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    performance_test = substituteSource {
      src = fetchgit {
        name = "performance_test-source";
        url = "https://github.com/ros2-gbp/performance_test-release.git";
        rev = "be48f37e34cf496f4c557b712c3fe4c7491783d5";
        hash = "sha256-wlQOogTIJm3/yPmuBAhSGRXFNiy0UAJyPZfWK+NgsyQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/Tencent/rapidjson.git";
          to = "URL ${performance_test-vendor_source-rapidjson-1}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/mirror/tclap.git";
          to = "URL ${performance_test-vendor_source-tclap-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/p-ranav/tabulate.git";
          to = "URL ${performance_test-vendor_source-tabulate-2}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/r-lyeh-archived/sole.git";
          to = "URL ${performance_test-vendor_source-sole-3}";
        }
      ];
    };
    performance_test-vendor_source-rapidjson-1 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-rapidjson-1-source";
        url = "https://github.com/Tencent/rapidjson.git";
        rev = "f54b0e47a08782a6131cc3d60f94d038fa6e0a51";
        hash = "sha256-mFM1Etpf+qF/G0t91eXD8FQXwSQKyQbJq8gUA0jsm4Q=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-sole-3 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-sole-3-source";
        url = "https://github.com/r-lyeh-archived/sole.git";
        rev = "e4678426147adb9d4f9f978c9560a7d0343b8c32";
        hash = "sha256-HxTUT2NFLkg4MDqN8iIUr/22gXiWV0CKSi1TD0nSazc=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-tabulate-2 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-tabulate-2-source";
        url = "https://github.com/p-ranav/tabulate.git";
        rev = "57b1032aff2d8b115a56d20c2584170bae0ff852";
        hash = "sha256-yI6KLWjquuxnqXPe9Q4rPTwQv+FBr/EtPJx3fOqg63M=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-tclap-0 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-tclap-0-source";
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
  version = "2.0.0-2";
  src = sources.performance_test;
  nativeBuildInputs = [ ament_cmake git rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rmw_implementation rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Tool to test performance of ROS2 and DDS data layers and communication.";
  };
}
