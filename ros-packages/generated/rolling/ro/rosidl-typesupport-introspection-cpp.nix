{
  ament-cmake,
  ament-cmake-ros,
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
  rosidl-generator-cpp,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_introspection_cpp";
  version = "4.9.2-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_introspection_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_typesupport_introspection_cpp" = substituteSource {
        src = fetchgit {
          name = "rosidl_typesupport_introspection_cpp-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "f86d6038c03b9c024a954d9a83a973a7fee6eea2";
          hash = "sha256-kK32ocC2E+DxFiG8S+DrCVW4UKCMrMfwbXT9FO0rat0=";
        };
      };
    });
  };
  meta = {
    description = "Generate the message type support for dynamic message construction in C++.";
  };
})
