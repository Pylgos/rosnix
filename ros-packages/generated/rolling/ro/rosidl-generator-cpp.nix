{
  ament-cmake,
  ament-cmake-core,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-generator-type-description,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_cpp";
  version = "4.9.3-1";
  src = finalAttrs.passthru.sources."rosidl_generator_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-type-description rosidl-parser rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-type-description rosidl-parser rosidl-pycommon ];
  depsTargetTargetPropagated = [ ament-index-python rosidl-runtime-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "63bc9ba152092702a222b1fc119defdb969cc2ae";
        hash = "sha256-tY2OYhg1YwSwLhzRUtGGYjVivLjShM2Co9so0FA08kE=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
})
