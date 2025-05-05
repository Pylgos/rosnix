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
  version = "4.6.5-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_introspection_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-interface rosidl-typesupport-introspection-c ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_introspection_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "720fed1fee2e22422d50c320935063ecea8da8ce";
        hash = "sha256-uh/MxWhrMS8fZEfpsgdVL1tyAgYleo2oAVdzHmzNbEI=";
      };
    };
  });
  meta = {
    description = "\n    Generate the message type support for dynamic message construction in C++.\n  ";
  };
})
