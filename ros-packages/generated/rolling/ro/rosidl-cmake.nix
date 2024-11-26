{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-pycommon,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_cmake";
  version = "4.9.2-1";
  src = finalAttrs.passthru.sources."rosidl_cmake";
  nativeBuildInputs = [ ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  buildInputs = [ ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake rosidl-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_cmake" = substituteSource {
        src = fetchgit {
          name = "rosidl_cmake-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "25ed1379bd7b49ffc25bad87ce60bd70d0b00995";
          hash = "sha256-yCyu3MX2CE7iaLTR1CWo9d85x+ZS+SmmJ6ywRTpjFZs=";
        };
      };
    });
  };
  meta = {
    description = "The CMake functionality to invoke code generation for ROS interface files.";
  };
})
