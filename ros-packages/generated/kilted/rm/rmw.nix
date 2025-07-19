{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-ros-core,
  ament-cmake-version,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcutils,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw";
  version = "7.8.2-2";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ament-cmake-version ];
  propagatedNativeBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "2211667a534e1212f32ae0ff09ef27d25aec452c";
        hash = "sha256-UerAL72wdCQeT+NJ+kYi8vMe3J+B1OkcowrhF9WoiT4=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
