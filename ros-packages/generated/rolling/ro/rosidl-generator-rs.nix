{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-generator-c,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-typesupport-c,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_rs";
  version = "0.4.7-1";
  src = finalAttrs.passthru.sources."rosidl_generator_rs";
  propagatedNativeBuildInputs = [ ament-cmake ros-environment rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-typesupport-c rosidl-typesupport-interface ];
  propagatedBuildInputs = [ ament-cmake ros-environment rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-typesupport-c rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-generator-c rosidl-pycommon ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_rs" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_rs-source";
        url = "https://github.com/ros2-gbp/rosidl_rust-release.git";
        rev = "25f210c9fb0103c1210138e2bda27f60560a10cd";
        hash = "sha256-YJQYN9Gp3hoek+FAlZRndGR0KM4UfSGJ7tHvV9Z+ue4=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Rust.";
  };
})
