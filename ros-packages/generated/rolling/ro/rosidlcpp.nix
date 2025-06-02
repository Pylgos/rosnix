{
  ament-cmake,
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidlcpp-generator-c,
  rosidlcpp-generator-cpp,
  rosidlcpp-generator-py,
  rosidlcpp-generator-type-description,
  rosidlcpp-typesupport-c,
  rosidlcpp-typesupport-cpp,
  rosidlcpp-typesupport-fastrtps-c,
  rosidlcpp-typesupport-fastrtps-cpp,
  rosidlcpp-typesupport-introspection-c,
  rosidlcpp-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidlcpp-generator-c rosidlcpp-generator-cpp rosidlcpp-generator-py rosidlcpp-generator-type-description rosidlcpp-typesupport-c rosidlcpp-typesupport-cpp rosidlcpp-typesupport-fastrtps-c rosidlcpp-typesupport-fastrtps-cpp rosidlcpp-typesupport-introspection-c rosidlcpp-typesupport-introspection-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core rosidlcpp-generator-c rosidlcpp-generator-cpp rosidlcpp-generator-py rosidlcpp-generator-type-description rosidlcpp-typesupport-c rosidlcpp-typesupport-cpp rosidlcpp-typesupport-fastrtps-c rosidlcpp-typesupport-fastrtps-cpp rosidlcpp-typesupport-introspection-c rosidlcpp-typesupport-introspection-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "a3938725f03beb50aedd1d95d58321972690a400";
        hash = "sha256-Ubi3VrFEqhaW3KMYEmGjJIwJvzjYjzGUU5TWU3DdwL0=";
      };
    };
  });
  meta = {
    description = "Meta package depending on all rosidlcpp generators";
  };
})
