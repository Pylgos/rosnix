{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rmw-implementation,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "performance_test" = substituteSource {
      src = fetchgit {
        name = "performance_test-source";
        url = "https://github.com/ros2-gbp/performance_test-release.git";
        rev = "ca283fe37b185a11c03565f4506cb0eb36c12564";
        hash = "sha256-xnTxHvplWaFior1NZmiF+oFRCJ2cvWwKWUY55BnS4ns=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/Tencent/rapidjson.git";
          to = "URL ${sources."performance_test/rapidjson"}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/mirror/tclap.git";
          to = "URL ${sources."performance_test/tclap"}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/p-ranav/tabulate.git";
          to = "URL ${sources."performance_test/tabulate"}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/r-lyeh-archived/sole.git";
          to = "URL ${sources."performance_test/sole"}";
        }
      ];
    };
    "performance_test/rapidjson" = substituteSource {
      src = fetchgit {
        name = "rapidjson-source";
        url = "https://github.com/Tencent/rapidjson.git";
        rev = "f54b0e47a08782a6131cc3d60f94d038fa6e0a51";
        hash = "sha256-mFM1Etpf+qF/G0t91eXD8FQXwSQKyQbJq8gUA0jsm4Q=";
      };
      substitutions = [
      ];
    };
    "performance_test/sole" = substituteSource {
      src = fetchgit {
        name = "sole-source";
        url = "https://github.com/r-lyeh-archived/sole.git";
        rev = "e4678426147adb9d4f9f978c9560a7d0343b8c32";
        hash = "sha256-HxTUT2NFLkg4MDqN8iIUr/22gXiWV0CKSi1TD0nSazc=";
      };
      substitutions = [
      ];
    };
    "performance_test/tabulate" = substituteSource {
      src = fetchgit {
        name = "tabulate-source";
        url = "https://github.com/p-ranav/tabulate.git";
        rev = "57b1032aff2d8b115a56d20c2584170bae0ff852";
        hash = "sha256-yI6KLWjquuxnqXPe9Q4rPTwQv+FBr/EtPJx3fOqg63M=";
      };
      substitutions = [
      ];
    };
    "performance_test/tclap" = substituteSource {
      src = fetchgit {
        name = "tclap-source";
        url = "https://github.com/mirror/tclap.git";
        rev = "799a8b1f99818e39fee19d0601030770af1221e1";
        hash = "sha256-kdrzAj5C/9AmA8OGntgmq4bAadAFzu6nz2brAddLNIk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "performance-test";
  version = "2.3.0-1";
  src = sources."performance_test";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rmw-implementation rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tool to test performance of ROS2 and DDS data layers and communication.";
  };
}