{
  ament-cmake-core,
  ament-cmake-ros-core,
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
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_cpp";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-generator-type-description rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-generator-type-description rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "276844b4fdcb94a22edfbe30e673378f90bf79f3";
        hash = "sha256-kGiyDpkElSjggdFTlXDQKu3k+asuX/H9i/5FJFsUiDo=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C++ messages.";
  };
})
