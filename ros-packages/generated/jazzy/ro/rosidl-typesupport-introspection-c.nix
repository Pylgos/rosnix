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
  rosidl-parser,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_introspection_c";
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_introspection_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-python rosidl-runtime-c rosidl-typesupport-interface ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_typesupport_introspection_c" = substituteSource {
        src = fetchgit {
          name = "rosidl_typesupport_introspection_c-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "c1a98410d5f6248fa8488e35b1382a7b9af68fe7";
          hash = "sha256-V0kl0v8lgloe51nsvOVu+ksFibfQRDDv4RXo/NRQcoc=";
        };
      };
    });
  };
  meta = {
    description = "Generate the message type support for dynamic message construction in C.";
  };
})
