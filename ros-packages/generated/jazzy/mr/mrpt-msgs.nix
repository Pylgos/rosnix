{
  ament-cmake,
  ament-cppcheck,
  ament-cpplint,
  ament-lint-auto,
  ament-lint-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_msgs";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."mrpt_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-cppcheck ament-cpplint ament-lint-auto ament-lint-cmake ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_msgs" = substituteSource {
        src = fetchgit {
          name = "mrpt_msgs-source";
          url = "https://github.com/ros2-gbp/mrpt_msgs-release.git";
          rev = "511572c818836f20c46ecc3b0612b9781bd7b07c";
          hash = "sha256-kzyjY/49L47+2kgZ/rg3m1pP60+muDrYNp+XxufWJos=";
        };
      };
    });
  };
  meta = {
    description = "ROS messages for MRPT classes and objects";
  };
})
