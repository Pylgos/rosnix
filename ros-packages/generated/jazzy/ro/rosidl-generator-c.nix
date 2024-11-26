{
  ament-cmake-core,
  ament-cmake-python,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-type-description,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_c";
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_generator_c";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cli rosidl-cmake rosidl-generator-type-description rosidl-parser rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core rosidl-cli rosidl-cmake rosidl-generator-type-description rosidl-parser rosidl-pycommon ];
  depsTargetTargetPropagated = [ ament-index-python rcutils rosidl-typesupport-interface ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_generator_c" = substituteSource {
        src = fetchgit {
          name = "rosidl_generator_c-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "2d01aa73999532545fd4d0199e075cd2932e809d";
          hash = "sha256-XErLGtJlEaDIRHaAieObwgtmqXaYg/dxSnZLf21CyDQ=";
        };
      };
    });
  };
  meta = {
    description = "Generate the ROS interfaces in C.";
  };
})
