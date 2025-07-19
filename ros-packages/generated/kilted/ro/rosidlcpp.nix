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
  version = "0.2.1-1";
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
        rev = "a25d7d2aced3bffa57cef0ada3d68ab34f56d10d";
        hash = "sha256-oE5BfoK/93lUMelK00Vju1XRVCWkKT50L7oyBWahwHU=";
      };
    };
  });
  meta = {
    description = "Meta package depending on all rosidlcpp generators";
  };
})
