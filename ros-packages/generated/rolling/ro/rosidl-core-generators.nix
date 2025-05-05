{
  ament-cmake,
  ament-cmake-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-generator-c,
  rosidl-generator-cpp,
  rosidl-generator-py,
  rosidl-generator-type-description,
  rosidl-typesupport-c,
  rosidl-typesupport-cpp,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-fastrtps-cpp,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_core_generators";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidl_core_generators";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-generator-py rosidl-generator-type-description rosidl-typesupport-c rosidl-typesupport-cpp rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-generator-py rosidl-generator-type-description rosidl-typesupport-c rosidl-typesupport-cpp rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_core_generators" = substituteSource {
      src = fetchgit {
        name = "rosidl_core_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "2120ed4b8f1fc101c93589ef14bf926cfc82e69a";
        hash = "sha256-lXlc6uQoGj3TlHi4eK4Rjz05w8snFSLtFREWHgm4zek=";
      };
    };
  });
  meta = {
    description = "A configuration package defining core ROS interface generators.";
  };
})
