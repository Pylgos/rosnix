{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-common-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_fuel_tools_vendor";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."gz_fuel_tools_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-fuel_tools10" "libcurl-dev" "libgflags-dev" "libjsoncpp-dev" "libyaml-dev" "libzip-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-common-vendor gz-math-vendor gz-msgs-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-fuel_tools10" "libcurl-dev" "libgflags-dev" "libjsoncpp-dev" "libyaml-dev" "libzip-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "gz_fuel_tools_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_fuel_tools_vendor-source";
        url = "https://github.com/ros2-gbp/gz_fuel_tools_vendor-release.git";
        rev = "52b3fe497ef701459a74b62617371ee9697892fe";
        hash = "sha256-KG72owcVroJv0BU2mgbj9lk1js0lhA+6dC/qKDhmns4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_fuel_tools_vendor/gz-fuel-tools"}";
        }
      ];
    };
    "gz_fuel_tools_vendor/gz-fuel-tools" = substituteSource {
      src = fetchgit {
        name = "gz-fuel-tools-source";
        url = "https://github.com/gazebosim/gz-fuel-tools.git";
        rev = "84842609463393207786494b22cea539b8f159c3";
        hash = "sha256-/Xfhec6kpv6srSp+hudqBaK4dKFn0QK45aGqxzNyytw=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-fuel_tools10 10.0.1\n\n    Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel\n  ";
  };
})
