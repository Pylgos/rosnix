{
  ament-cmake,
  ament-cmake-ros-core,
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
  version = "5.1.1-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_introspection_c";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_introspection_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "ffdcfdbcad057aff8b85c03d7e91776143c382a5";
        hash = "sha256-NZNkJMmqNEfcuDtQzKuPW0ZIEEsIUas0tMkb5a3HRis=";
      };
    };
  });
  meta = {
    description = "\n    Generate the message type support for dynamic message construction in C.\n  ";
  };
})
