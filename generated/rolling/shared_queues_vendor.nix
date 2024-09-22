{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    shared_queues_vendor = substituteSource {
      src = fetchgit {
        name = "shared_queues_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "5bfdbc60c3ab76b8308362830dd9aaa3fc7cb7e0";
        hash = "sha256-1Jz+rLYhCEk7DLVDD6024TMbRbGI5W6GChosnvU6vHA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0}";
        }
      ];
    };
    shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0 = substituteSource {
      src = fetchzip {
        name = "shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0-source";
        url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
        hash = "sha256-tfF1cjjiVn/Di2rYUS7TAqD4ojx7x0eRHVyn/GG/7+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "shared_queues_vendor";
  version = "0.29.0-1";
  src = sources.shared_queues_vendor;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for concurrent queues from moodycamel";
  };
}
