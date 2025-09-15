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
  version = "0.4.0-1";
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
        rev = "440f747005b12c19da288169369e515417c5a967";
        hash = "sha256-jsT3Cwpu0+T3ufc4bjrPRrzejfzEOx30FzlLdOojM+s=";
      };
    };
  });
  meta = {
    description = "Meta package depending on all rosidlcpp generators";
  };
})
