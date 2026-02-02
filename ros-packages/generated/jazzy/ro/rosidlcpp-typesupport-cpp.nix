{
  ament-cmake-core,
  ament-cmake-ros,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  ros-environment,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-generator-type-description,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-cpp,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_cpp";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-generator-type-description rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-interface rosidl-typesupport-introspection-cpp rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-generator-type-description rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-interface rosidl-typesupport-introspection-cpp rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "a2e7fa904be621011851bf2ea3b3e7c2314649e0";
        hash = "sha256-kGiyDpkElSjggdFTlXDQKu3k+asuX/H9i/5FJFsUiDo=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C++ messages.";
  };
})
